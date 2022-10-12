package bit.data.controller;

import bit.data.dto.*;
import bit.data.service.*;
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
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    CafeServiceInter cafeService;

    @Autowired
    TripServiceInter tripService;

    @Autowired
    FoodServiceInter foodService;

    @Autowired
    UserServiceInter userService;

    @Autowired
    AdminServiceInter adminService;

    @GetMapping("/admin/list")//관리자페이지 생성하면 수정필요~!
    public String Dashboard(Model model){
        //총 회원 수
        model.addAttribute("userTotal",userService.getTotalCount());
        //총 코스 수
        int c=adminService.selectCafeTotalCount();
        int f=adminService.selectFoodTotalCount();
        int t=adminService.selectTripTotalCount();
        model.addAttribute("cft",c+f+t);
        //오늘 작성된 리뷰
        int review=adminService.todayReview();
        model.addAttribute("review",review);
        //답변 안 된 문의사항 수
        int qna=adminService.qnaNotAnswer();
        model.addAttribute("qna",qna);
        return "adminDashboard";
    }

    @GetMapping("/admin/mainhome")//관리자페이지 생성하면 수정필요~!
    public String main() {
        return "/bit/layout/main";

    }

    @GetMapping("/admin/userinfo")//관리자페이지 생성하면 수정필요~!
    public String userInfo( @RequestParam(defaultValue = "1") int currentPage,
                            @RequestParam(value = "searchcolumn", required = false, defaultValue = "") String sc,
                            @RequestParam(value = "searchword", required = false, defaultValue = "") String sw,
                            Model model
    )
    {
        int totalCount = adminService.getTotalCount(sc,sw);
        int perPage = 10; // 한 페이지당 보여질 글의 갯수 1줄에 4개씩 2줄
        int perBlock = 10; // 한 블럭당 보여질 페이지의 갯수
        int startNum; // db에서 가져올 글의 시작번호 (mysql은 첫 글이 0번)
        int startPage; // 각 블럭당 보여질 시작 페이지
        int endPage; // 각 블럭당 보여질 끝 페이지
        int totalPage; // 총 페이지 수
        int no; // 각 페이지당 출력할 시작번호

        totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1); // 총 페이지 수 구한다, 나머지가 1이라도 있으면 1페이지 추가
        startPage = (currentPage - 1) / perBlock * perBlock + 1; // 블럭당 보여질 시작 페이지
        endPage = startPage + perBlock - 1; // 끝 페이지는 시작 페이지+블럭당 보여질 페이지 -1
        if (endPage > totalPage) {
            endPage = totalPage; // 끝 페이지가 총 페이지보다 작으면 끝 페이지가 총 페이지
        }
        startNum = (currentPage - 1) * perPage; // 각 페이지에서 보여질 시작 번호
        no = totalCount - (currentPage - 1) * perPage; // 각 페이지당 출력할 시작번호

        List<UserDto> list = adminService.getUserPaging(sc,sw,startNum,perPage);

        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("searchcolumn",sc);
        model.addAttribute("searchword",sw);

        return "userInfo";

    }

    @GetMapping("/admin/userdelete")
    public String userdelete(int user_num) {
        adminService.deleteUserByNum(user_num);
        return "redirect:userinfo";
    }

    @GetMapping("/admin/cafecourse")//관리자페이지 생성하면 수정필요~!
    public String cafeCourse(@RequestParam(defaultValue = "1") int currentPage,
                             @RequestParam(value = "searchcolumn", required = false, defaultValue = "") String sc,
                             @RequestParam(value = "searchword", required = false, defaultValue = "") String sw,
                             Model model) {
        int totalCount = adminService.getCafeTotal(sc,sw);
        int perPage = 10; // 한 페이지당 보여질 글의 갯수 1줄에 4개씩 2줄
        int perBlock = 10; // 한 블럭당 보여질 페이지의 갯수
        int startNum; // db에서 가져올 글의 시작번호 (mysql은 첫 글이 0번)
        int startPage; // 각 블럭당 보여질 시작 페이지
        int endPage; // 각 블럭당 보여질 끝 페이지
        int totalPage; // 총 페이지 수
        int no; // 각 페이지당 출력할 시작번호

        totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1); // 총 페이지 수 구한다, 나머지가 1이라도 있으면 1페이지 추가
        startPage = (currentPage - 1) / perBlock * perBlock + 1; // 블럭당 보여질 시작 페이지
        endPage = startPage + perBlock - 1; // 끝 페이지는 시작 페이지+블럭당 보여질 페이지 -1
        if (endPage > totalPage) {
            endPage = totalPage; // 끝 페이지가 총 페이지보다 작으면 끝 페이지가 총 페이지
        }
        startNum = (currentPage - 1) * perPage; // 각 페이지에서 보여질 시작 번호
        no = totalCount - (currentPage - 1) * perPage; // 각 페이지당 출력할 시작번호

        List<CafeDto> list = adminService.getCafePaging(sc,sw,startNum,perPage);

        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("searchcolumn",sc);
        model.addAttribute("searchword",sw);
        return "cafeCourse";

    }
    @GetMapping("/admin/cafedelete")
    public String cafedelete(@RequestParam(value="cafe_num[]") ArrayList<Integer> cafe_num,
                             @RequestParam(defaultValue = "1") int currentPage)
    {
        for(int i=0;i<cafe_num.size();i++){
            adminService.deleteCafeByNum(cafe_num.get(i));
        }
        return "redirect:cafecourse?currentPage="+currentPage;
    }

    @GetMapping("/admin/foodcourse")//관리자페이지 생성하면 수정필요~!
    public String foodCourse(@RequestParam(defaultValue = "1") int currentPage,
                             @RequestParam(value = "searchcolumn", required = false, defaultValue = "") String sc,
                             @RequestParam(value = "searchword", required = false, defaultValue = "") String sw,
                             Model model) {
        int totalCount = adminService.getFoodTotal(sc,sw);
        int perPage = 10; // 한 페이지당 보여질 글의 갯수 1줄에 4개씩 2줄
        int perBlock = 10; // 한 블럭당 보여질 페이지의 갯수
        int startNum; // db에서 가져올 글의 시작번호 (mysql은 첫 글이 0번)
        int startPage; // 각 블럭당 보여질 시작 페이지
        int endPage; // 각 블럭당 보여질 끝 페이지
        int totalPage; // 총 페이지 수
        int no; // 각 페이지당 출력할 시작번호

        totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1); // 총 페이지 수 구한다, 나머지가 1이라도 있으면 1페이지 추가
        startPage = (currentPage - 1) / perBlock * perBlock + 1; // 블럭당 보여질 시작 페이지
        endPage = startPage + perBlock - 1; // 끝 페이지는 시작 페이지+블럭당 보여질 페이지 -1
        if (endPage > totalPage) {
            endPage = totalPage; // 끝 페이지가 총 페이지보다 작으면 끝 페이지가 총 페이지
        }
        startNum = (currentPage - 1) * perPage; // 각 페이지에서 보여질 시작 번호
        no = totalCount - (currentPage - 1) * perPage; // 각 페이지당 출력할 시작번호

        List<FoodDto> list = adminService.getFoodPaging(sc,sw,startNum,perPage);

        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("searchcolumn",sc);
        model.addAttribute("searchword",sw);
        return "foodCourse";

    }
    @GetMapping("/admin/fooddelete")
    public String fooddelete(@RequestParam(value="food_num[]") ArrayList<Integer> food_num,
                             @RequestParam(defaultValue = "1") int currentPage)
    {
        for(int i=0;i<food_num.size();i++){
            adminService.deleteFoodByNum(food_num.get(i));
        }
        return "redirect:foodcourse?currentPage="+currentPage;
    }
    @GetMapping("/admin/tripcourse")//관리자페이지 생성하면 수정필요~!
    public String tripCourse(@RequestParam(defaultValue = "1") int currentPage,
                             @RequestParam(value = "searchcolumn", required = false, defaultValue = "") String sc,
                             @RequestParam(value = "searchword", required = false, defaultValue = "") String sw,
                             Model model) {
        int totalCount = adminService.getTripTotal(sc,sw);
        int perPage = 10; // 한 페이지당 보여질 글의 갯수 1줄에 4개씩 2줄
        int perBlock = 10; // 한 블럭당 보여질 페이지의 갯수
        int startNum; // db에서 가져올 글의 시작번호 (mysql은 첫 글이 0번)
        int startPage; // 각 블럭당 보여질 시작 페이지
        int endPage; // 각 블럭당 보여질 끝 페이지
        int totalPage; // 총 페이지 수
        int no; // 각 페이지당 출력할 시작번호

        totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1); // 총 페이지 수 구한다, 나머지가 1이라도 있으면 1페이지 추가
        startPage = (currentPage - 1) / perBlock * perBlock + 1; // 블럭당 보여질 시작 페이지
        endPage = startPage + perBlock - 1; // 끝 페이지는 시작 페이지+블럭당 보여질 페이지 -1
        if (endPage > totalPage) {
            endPage = totalPage; // 끝 페이지가 총 페이지보다 작으면 끝 페이지가 총 페이지
        }
        startNum = (currentPage - 1) * perPage; // 각 페이지에서 보여질 시작 번호
        no = totalCount - (currentPage - 1) * perPage; // 각 페이지당 출력할 시작번호

        List<TripDto> list = adminService.getTripPaging(sc,sw,startNum,perPage);

        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("searchcolumn",sc);
        model.addAttribute("searchword",sw);
        return "tripCourse";

    }
    @GetMapping("/admin/tripdelete")
    public String tripdelete(@RequestParam(value="trip_num[]") ArrayList<Integer> trip_num,
                             @RequestParam(defaultValue = "1") int currentPage)
    {
        for(int i=0;i<trip_num.size();i++){
            adminService.deleteTripByNum(trip_num.get(i));
        }
        return "redirect:tripcourse?currentPage="+currentPage;
    }

    @GetMapping("/admin/question")//관리자페이지 생성하면 수정필요~!
    public String question() {
        return "question";
    }

    @GetMapping("/admin/cafeinsert")
    public String cafeInsert(){
        return "cafeinsertform";
    }
    @PostMapping("/admin/cafeinsertact")
    public String cafeInsertAct(CafeDto dto, MultipartFile upload, HttpServletRequest request) {
        //업로드 경로
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
        //업로드를 안햇을 경우 0번지의 파일명이 "" (빈문자열)이 된다
        //업로드 안해도 upload.size가 1이 된다

        if (upload.getOriginalFilename().equals("")) {
            dto.setPhoto("noimage.png");
        } else {
            //파일명을 현재 날짜로 변경 후 ,로 연결
            String photo = ChangeName.getChangeFileName(upload.getOriginalFilename());
            try {
                upload.transferTo(new File(path + "/" + photo));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            dto.setPhoto(photo);
        }
        adminService.cafeInsertAct(dto);
        return "redirect:cafecourse";
    }
    @GetMapping("/admin/cafeupdform")
    public String cafeupdform(int cafe_num, int currentPage,Model model) {
        //num에 해당하는 dto 얻기
        CafeDto dto = cafeService.selectByNum(cafe_num);
        model.addAttribute("dto",dto);
        model.addAttribute("currentPage",currentPage);
        return "cafeupdform";
    }

    @PostMapping("/admin/cafeupdact")
    public String cafeUpdate(CafeDto dto, int currentPage,MultipartFile upload,HttpServletRequest request) {
        //업로드 경로
        String path=request.getSession().getServletContext().getRealPath("/resources/upload");
        //업로드를 안햇을 경우 0번지의 파일명이 "" (빈문자열)이 된다
        //업로드 안해도 upload.size가 1이 된다

        if(upload.getOriginalFilename().equals("")) {
            dto.setPhoto(null);//기존 사진들을 수정 안한다
        }else {
                String photo=ChangeName.getChangeFileName(upload.getOriginalFilename());

            try {
                upload.transferTo(new File(path+"/"+photo));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            dto.setPhoto(photo);
        }
        //db에 update
        adminService.cafeUpdAct(dto);
        return "redirect:cafecourse?currentPage="+currentPage;
    }

    @GetMapping("/admin/foodinsert")
    public String foodInsert(){
        return "foodinsertform";
    }

    @PostMapping("/admin/foodinsertact")
    public String foodInsertAct(FoodDto dto, MultipartFile upload, HttpServletRequest request) {
        //업로드 경로
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
        //업로드를 안햇을 경우 0번지의 파일명이 "" (빈문자열)이 된다
        //업로드 안해도 upload.size가 1이 된다

        if (upload.getOriginalFilename().equals("")) {
            dto.setPhoto("noimage.png");
        } else {
                //파일명을 현재 날짜로 변경 후 ,로 연결
                String photo = ChangeName.getChangeFileName(upload.getOriginalFilename());
            try {
                upload.transferTo(new File(path + "/" + photo));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            dto.setPhoto(photo);
        }
        adminService.foodInsertAct(dto);
        return "redirect:foodcourse";
    }
    @GetMapping("/admin/foodupdform")
    public String foodupdform(int food_num, int currentPage,Model model) {
        //num에 해당하는 dto 얻기
        FoodDto dto = foodService.selectByNum(food_num);
        model.addAttribute("dto",dto);
        model.addAttribute("currentPage",currentPage);
        return "foodupdform";
    }
    @PostMapping("/admin/foodupdact")
    public String foodUpdate(FoodDto dto, int currentPage,MultipartFile upload,HttpServletRequest request) {
        //업로드 경로
        String path=request.getSession().getServletContext().getRealPath("/resources/upload");
        //업로드를 안햇을 경우 0번지의 파일명이 "" (빈문자열)이 된다
        //업로드 안해도 upload.size가 1이 된다

        if(upload.getOriginalFilename().equals("")) {
            dto.setPhoto(null);//기존 사진들을 수정 안한다
        }else {
            String photo=ChangeName.getChangeFileName(upload.getOriginalFilename());

            try {
                upload.transferTo(new File(path+"/"+photo));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            dto.setPhoto(photo);
        }
        //db에 update
        adminService.foodUpdAct(dto);
        return "redirect:foodcourse?currentPage="+currentPage;
    }

    @GetMapping("/admin/tripinsert")
    public String tripInsert(){
        return "tripinsertform";
    }

    @PostMapping("/admin/tripinsertact")
    public String tripInsertAct(TripDto dto, MultipartFile upload, HttpServletRequest request) {
        //업로드 경로
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
        //업로드를 안햇을 경우 0번지의 파일명이 "" (빈문자열)이 된다
        //업로드 안해도 upload.size가 1이 된다

        if (upload.getOriginalFilename().equals("")) {
            dto.setPhoto("noimage.png");
        } else {
            //파일명을 현재 날짜로 변경 후 ,로 연결
            String photo = ChangeName.getChangeFileName(upload.getOriginalFilename());
            try {
                upload.transferTo(new File(path + "/" + photo));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            dto.setPhoto(photo);
        }
        adminService.tripInsertAct(dto);
        return "redirect:tripcourse";
    }
    @GetMapping("/admin/tripupdform")
    public String tripupdform(int trip_num, int currentPage,Model model) {
        //num에 해당하는 dto 얻기
        TripDto dto = tripService.selectByNum(trip_num);
        model.addAttribute("dto",dto);
        model.addAttribute("currentPage",currentPage);
        return "tripupdform";

    }

    @PostMapping("/admin/tripupdact")
    public String tripUpdate(TripDto dto, int currentPage,MultipartFile upload,HttpServletRequest request) {
        //업로드 경로
        String path=request.getSession().getServletContext().getRealPath("/resources/upload");
        //업로드를 안햇을 경우 0번지의 파일명이 "" (빈문자열)이 된다
        //업로드 안해도 upload.size가 1이 된다

        if(upload.getOriginalFilename().equals("")) {
            dto.setPhoto(null);//기존 사진들을 수정 안한다
        }else {
            String photo=ChangeName.getChangeFileName(upload.getOriginalFilename());

            try {
                upload.transferTo(new File(path+"/"+photo));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            dto.setPhoto(photo);
        }
        //db에 update
        adminService.tripUpdAct(dto);
        return "redirect:tripcourse?currentPage="+currentPage;
    }
}
