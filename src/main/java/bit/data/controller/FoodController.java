package bit.data.controller;

import bit.data.dto.CafeDto;
import bit.data.dto.FoodDto;
import bit.data.dto.TripDto;
import bit.data.service.CafeServiceInter;
import bit.data.service.CommentCourseServiceInter;
import bit.data.service.FoodServiceInter;
import bit.data.service.TripServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class FoodController {
    @Autowired
    FoodServiceInter foodService;

    @Autowired
    CommentCourseServiceInter commentCourseService;

    @GetMapping("/courseboard/foodlist")
    @ResponseBody
    public List<FoodDto> foodlist(
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(value = "foodcolumn", required = false) String fc,
            @RequestParam(value = "foodword", required = false) String fw,
            Model model
    ) {
        int FoodtotalCount = foodService.selectTotalCount(fc, fw);
        int perPage = 8;//한페이지당 보여질 글의 갯수
        int perBlock = 6;//한블럭당 보여질 페이지의 갯수
        int FoodstartNum;//db에서 가져올 글의 시작번호(mysql은 첫글이 0번,오라클은 1번)
        int FoodstartPage;//각블럭당 보여질 시작페이지
        int FoodendPage;//각 블럭당 보여질 끝페이지
        int FoodtotalPage;//총 페이지수
        int no;//각 페이지당 출력할 시작번호

        //총 페이지수를 구한다
        //총글의갯수/한페이지당보여질갯수로 나눔(7/5=1)
        //나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
        FoodtotalPage = FoodtotalCount / perPage + (FoodtotalCount % perPage == 0 ? 0 : 1);

        //각 블럭당 보여질 시작페이지
        //perBlock=5 일경우 현재페이지가 1~5 일경우는 시작페이지가 1, 끝페이지가 5
        //만약 현재페이지가 13 일경우는 시작페이지가 11, 끝페이지가 15
        FoodstartPage = (currentPage - 1) / perBlock * perBlock + 1;
        FoodendPage = FoodstartPage + perBlock - 1;

        //총페이지수가 23개일경우 마지막 블럭은 끝페이지가 25가 아니라 23이라야한다
        if (FoodendPage > FoodtotalPage)
            FoodendPage = FoodtotalPage;


        //각 페이지에서 보여질 시작번호
        //예: 1페이지->0, 2페이지:5, 3페이지 : 10...
        FoodstartNum = (currentPage - 1) * perPage;

        //각페이지당 출력할 시작번호 구하기
        //예: 총글갯수가 23이라면  1페이지는 23,2페이지는 18,3페이지는 13...
        no = FoodtotalCount - (currentPage - 1) * perPage;
        List<FoodDto> list = foodService.selectPagingList(fc, fw, FoodstartNum, perPage);

        for (FoodDto dto : list) {
            int answercount=commentCourseService.selectFoodStar(dto.getFood_num()).size();
            dto.setAnswercount(answercount);
            double staravg = commentCourseService.selectFoodStarAvg(dto.getFood_num());
            dto.setStaravg(staravg);
        }

        return list;
    }

}
