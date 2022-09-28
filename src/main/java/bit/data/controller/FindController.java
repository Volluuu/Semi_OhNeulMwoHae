package bit.data.controller;

import bit.data.dto.FindDto;
import bit.data.service.CommentFriendServiceInter;
import bit.data.service.FindServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
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
}
