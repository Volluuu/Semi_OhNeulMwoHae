package bit.data.controller;

import bit.data.dto.*;
import bit.data.service.CommentFriendServiceInter;
import bit.data.service.FindServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FindController {

    @Autowired
    FindServiceInter findService;

    @Autowired
    CommentFriendServiceInter commentFriendService;

    @GetMapping("/findboard/list")
    public String findBoard(
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(value = "findcolumn", required = false) String findcolumn,
            @RequestParam(value = "findword", required = false) String findword,
            Model model)
    {
        int totalCount=findService.selectTotalCount(findcolumn, findword); // 검색한 글의 갯수
        int perPage=8; // 한 페이지당 보여질 글의 갯수 1줄에 4개씩 2줄
        int perBlock=5; // 한 블럭당 보여질 페이지의 갯수
        int startNum; // db에서 가져올 글의 시작번호 (mysql은 첫 글이 0번)
        int startPage; // 각 블럭당 보여질 시작 페이지
        int endPage; // 각 블럭당 보여질 끝 페이지
        int totalPage; // 총 페이지 수
        int no; // 각 페이지당 출력할 시작번호

        totalPage=totalCount/perPage+(totalCount%perPage==0?0:1); // 총 페이지 수 구한다, 나머지가 1이라도 있으면 1페이지 추가
        startPage=(currentPage-1)/perBlock*perBlock+1; // 블럭당 보여질 시작 페이지
        endPage=startPage+perBlock-1; // 끝 페이지는 시작 페이지+블럭당 보여질 페이지 -1
        if(endPage>totalPage){
            endPage=totalPage; // 끝 페이지가 총 페이지보다 작으면 끝 페이지가 총 페이지
        }
        startNum=(currentPage-1)*perPage; // 각 페이지에서 보여질 시작 번호
        no=totalCount-(currentPage-1)*perPage; // 각 페이지당 출력할 시작번호

        List<FindDto> list=findService.findPagingList(findcolumn, findword, startNum, perPage);

        for(FindDto dto:list){
            int answercount=commentFriendService.selectAllComments(dto.getFind_num()).size();
            dto.setAnswercount(answercount);
        }

        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", totalPage);

        return "/bit/find/findboard";
    }

    @GetMapping("/findboard/login")
    @ResponseBody
    public void loginprocess(String user_num, String loginid, String password, String name,
                                            String nickname, String email, String hp, String profile,
                                            String interest, String profilephoto, String alarm,
                                            String isadmin, String gaipday, HttpSession session){
        session.setAttribute("loginok", "yes");
        session.setAttribute("user_num", user_num);
        session.setAttribute("loginid", loginid);
        session.setAttribute("password", password);
        session.setAttribute("name", name);
        session.setAttribute("nickname", nickname);
        session.setAttribute("email", email);
        session.setAttribute("hp", hp);
        session.setAttribute("profile", profile);
        session.setAttribute("interest", interest);
        session.setAttribute("profilephoto", profilephoto);
        session.setAttribute("alarm", alarm);
        session.setAttribute("isadmin", isadmin);
        session.setAttribute("gaipday", gaipday);
    }

    @GetMapping("/findboard/logout")
    @ResponseBody
    public void logoutprocess(HttpSession session){
        //로그아웃하면 제거할 옵션
        session.removeAttribute("loginok");
        session.removeAttribute("user_num");
        session.removeAttribute("loginid");
        session.removeAttribute("password");
        session.removeAttribute("name");
        session.removeAttribute("nickname");
        session.removeAttribute("email");
        session.removeAttribute("hp");
        session.removeAttribute("profile");
        session.removeAttribute("interest");
        session.removeAttribute("profilephoto");
        session.removeAttribute("alarm");
        session.removeAttribute("isadmin");
        session.removeAttribute("gaipday");
    }

    @GetMapping("/findboard/findform")
    public String findform(@RequestParam(defaultValue = "1") int currentPage,
                           Model model){
        model.addAttribute("currentPage", currentPage);
        return "/bit/find/findform";

    }

    @PostMapping("/findboard/insertfind")
    public String insertfind(FindDto dto, int currentPage, List<MultipartFile> findupload, HttpServletRequest request) {
        //업로드 경로
        String path=request.getSession().getServletContext().getRealPath("/resources/upload");
        System.out.println(path);
        //업로드를 안햇을 경우 0번지의 파일명이 "" (빈문자열)이 된다
        //업로드 안해도 upload.size가 1이 된다
        System.out.println(findupload.size());

        if(findupload.get(0).getOriginalFilename().equals("")) {
            dto.setPhoto("noimage.png");
        }else {
            String photo="";
            int idx=1;
            for(MultipartFile multi:findupload) {
                //파일명을 현재 날짜로 변경 후 ,로 연결
                String newName=idx++ +"_"+ ChangeName.getChangeFileName(multi.getOriginalFilename());
                photo+=newName+",";

                //업로드
                try {
                    multi.transferTo(new File(path+"/"+newName));
                } catch (IOException | IllegalStateException e) {
                    throw new RuntimeException(e);
                }

            }
            //마지막 컴마 제거
            photo=photo.substring(0,photo.length()-1);
            //dto에 저장
            dto.setPhoto(photo);
        }
        findService.insertFindBoard(dto);
        return "redirect:../findboard/list?currentPage="+currentPage;
    }

    @PostMapping("/findboard/updatefindaction")
    public String updatefindaction(FindDto dto, int currentPage, List<MultipartFile> findupload, HttpServletRequest request) {
        //업로드 경로
        String path=request.getSession().getServletContext().getRealPath("/resources/upload");
        System.out.println(path);
        //업로드를 안햇을 경우 0번지의 파일명이 "" (빈문자열)이 된다
        //업로드 안해도 upload.size가 1이 된다
        System.out.println(findupload.size());

        if(findupload.get(0).getOriginalFilename().equals("")) {
            dto.setPhoto(dto.getPhoto());
        }else {
            String photo="";
            int idx=1;
            for(MultipartFile multi:findupload) {
                //파일명을 현재 날짜로 변경 후 ,로 연결
                String newName=idx++ +"_"+ ChangeName.getChangeFileName(multi.getOriginalFilename());
                photo+=newName+",";

                //업로드
                try {
                    multi.transferTo(new File(path+"/"+newName));
                } catch (IOException | IllegalStateException e) {
                    throw new RuntimeException(e);
                }

            }
            //마지막 컴마 제거
            photo=photo.substring(0,photo.length()-1);
            //dto에 저장
            dto.setPhoto(photo);
        }
        findService.updateFindBoard(dto);
        return "redirect:../findboard/list?currentPage="+currentPage;
    }




    @GetMapping("/findboard/finddetail")
    public ModelAndView finddetail(int find_num, int currentPage) {
        ModelAndView mview=new ModelAndView();
        //조회수 증가
        findService.updateReadCount(find_num);
        //num에 해당하는 dto 얻기
        FindDto dto=findService.selectByNum(find_num);
        //글쓴 사람의 사진을 memphoto
        //이 때 글 쓴사람이 탈퇴했을경우 널포인터익셉션 발생
//        String memphoto="";
//        try {
//            memphoto=userService.selectByNum(dto.getId()).getPhoto();
//        }catch(NullPointerException e) {
//            memphoto="no";
//            dto.setName("탈퇴한 회원");
//        }

        mview.addObject("dto",dto);
        mview.addObject("currentPage",currentPage);
//        mview.addObject("memphoto", memphoto);
        mview.setViewName("/bit/find/finddetail");
        return mview;
    }

    @GetMapping("/findboard/updatefind")
    public String updateform(int find_num, int currentPage,Model model) {
        //num에 해당하는 dto 얻기
        FindDto dto=findService.selectByNum(find_num);

        model.addAttribute("dto",dto);
        model.addAttribute("currentPage",currentPage);

        return "/bit/find/updatefind";
    }

    @GetMapping("/findboard/insertlist")
    @ResponseBody
    public List<? extends Object> insertlist(
            @RequestParam(value = "ccolumn", required = false) String ccolumn,
            @RequestParam(value = "cword", required = false) String cword){
        if(ccolumn.equals("cafe")){
            List<CafeDto> list=findService.selectCafeData(cword);
            return list;
        }
        if(ccolumn.equals("trip")){
            List<TripDto> list=findService.selectTripData(cword);
            return list;
        }
        if(ccolumn.equals("food")){
            List<FoodDto> list=findService.selectFoodData(cword);
            return  list;
        }
        return null;
    }

    @GetMapping("/findboard/myplace")
    @ResponseBody
    public List<? extends Object> myplace(int user_num){
        System.out.println(user_num);
        return null;
    }

    @GetMapping("/findboard/deletefind")
    public String delete(int find_num,int currentPage,HttpServletRequest request) {
        String path=request.getSession().getServletContext().getRealPath("/resources/upload");
        System.out.println(path);

        String photo=findService.selectByNum(find_num).getPhoto();

        if(photo.indexOf(",")>=0){
            String sphoto[]=photo.split(",");
            for(int i=0;i< sphoto.length;i++){
                File file=new File(path+"/"+sphoto[i]);
                if(file.exists()){
                System.out.println("파일이 존재하므로 삭제합니다");
                file.delete();
                }
            }
        }else {
            File file=new File(path+"/"+photo);
            if(file.exists()){
                System.out.println("파일이 존재하므로 삭제합니다");
                file.delete();
            }
        }

        findService.deleteFindBoard(find_num);
        //삭제 후 보던 페이지로 이동
        return "redirect:../findboard/list?currentPage="+currentPage;
    }

    @GetMapping("/findboard/mycourse")
    @ResponseBody
    public List<CourseDto> selectMyCourse(int user_num){
        List<CourseDto> list=findService.selectMyCourse(user_num);

        return list;
    }

}
