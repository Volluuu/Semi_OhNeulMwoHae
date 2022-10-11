package bit.data.controller;

import bit.data.dto.*;
import bit.data.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
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
                            @RequestParam(value = "findcolumn", required = false) String findcolumn,
                            @RequestParam(value = "findword", required = false) String findword,
                            Model model
    )
    {
        int totalCount = adminService.getTotalCount();
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

        List<UserDto> list = adminService.userInfo();

        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", totalPage);

        return "userInfo";

    }

    @GetMapping("/admin/cafecourse")//관리자페이지 생성하면 수정필요~!
    public String cafeCourse() {
        return "cafeCourse";

    }

    @GetMapping("/admin/foodcourse")//관리자페이지 생성하면 수정필요~!
    public String foodCourse() {
        return "foodCourse";

    }
    @GetMapping("/admin/tripcourse")//관리자페이지 생성하면 수정필요~!
    public String tripCourse() {
        return "tripCourse";

    }
    @GetMapping("/admin/question")//관리자페이지 생성하면 수정필요~!
    public String question() {
        return "question";
    }





}
