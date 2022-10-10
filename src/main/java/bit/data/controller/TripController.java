package bit.data.controller;

import bit.data.dto.CafeDto;
import bit.data.dto.FoodDto;
import bit.data.dto.TripDto;
import bit.data.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TripController {

    @Autowired
    TripServiceInter tripService;
    @Autowired
    CommentCourseServiceInter commentCourseService;

    @Autowired
    SubsServiceInter subsService;

    @GetMapping("/courseboard/triplist")
    @ResponseBody
    public Map<String, Object> triplist(
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(value = "tripcolumn", required = false) String tc,
            @RequestParam(value = "tripword", required = false) String tw,
            @RequestParam(defaultValue = "0") int gu,
            Model model
    ) {
        int totalCount = tripService.selectTotalCount(tc, tw, gu);
        int perPage = 12;//한페이지당 보여질 글의 갯수
        int perBlock = 10;//한블럭당 보여질 페이지의 갯수
        int startNum;//db에서 가져올 글의 시작번호(mysql은 첫글이 0번,오라클은 1번)
        int startPage;//각블럭당 보여질 시작페이지
        int endPage;//각 블럭당 보여질 끝페이지
        int totalPage;//총 페이지수
        int no;//각 페이지당 출력할 시작번호

        //총 페이지수를 구한다
        //총글의갯수/한페이지당보여질갯수로 나눔(7/5=1)
        //나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
        totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

        //각 블럭당 보여질 시작페이지
        //perBlock=5 일경우 현재페이지가 1~5 일경우는 시작페이지가 1, 끝페이지가 5
        //만약 현재페이지가 13 일경우는 시작페이지가 11, 끝페이지가 15
        startPage = (currentPage - 1) / perBlock * perBlock + 1;
        endPage = startPage + perBlock - 1;

        //총페이지수가 23개일경우 마지막 블럭은 끝페이지가 25가 아니라 23이라야한다
        if (endPage > totalPage)
            endPage = totalPage;


        //각 페이지에서 보여질 시작번호
        //예: 1페이지->0, 2페이지:5, 3페이지 : 10...
        startNum = (currentPage - 1) * perPage;

        //각페이지당 출력할 시작번호 구하기
        //예: 총글갯수가 23이라면  1페이지는 23,2페이지는 18,3페이지는 13...
        no = totalCount - (currentPage - 1) * perPage;
        List<TripDto> list = tripService.selectPagingList(tc, tw, startNum, perPage, gu);

        for (TripDto dto : list) {
            int answercount = commentCourseService.selectTripstar(dto.getTrip_num()).size();
            dto.setAnswercount(answercount);
            double staravg = commentCourseService.selectTripStarAvg(dto.getTrip_num());
            dto.setStaravg(staravg);
            int substotal=subsService.selectTotalSubsTrip(dto.getTrip_num());
            dto.setSubstotal(substotal);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("totalCount", totalCount);
        map.put("currentPage", currentPage);
        map.put("startPage", startPage);
        map.put("endPage", endPage);
        map.put("no", no);
        map.put("totalPage", totalPage);
        map.put("findcolumn",tc);
        map.put("findword",tw);
        return map;
    }

    @GetMapping("/courseboard/triplistgu")
    @ResponseBody
    public Map<String, Object> triplistgu(
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(value = "tripcolumn", required = false) String tc,
            @RequestParam(value = "tripword", required = false) String tw,
            @RequestParam(defaultValue = "0") int gu,
            Model model
    ) {
        int totalCount = tripService.selectTotalCount(tc, tw, gu);
        int perPage = 12;//한페이지당 보여질 글의 갯수
        int perBlock = 10;//한블럭당 보여질 페이지의 갯수
        int startNum;//db에서 가져올 글의 시작번호(mysql은 첫글이 0번,오라클은 1번)
        int startPage;//각블럭당 보여질 시작페이지
        int endPage;//각 블럭당 보여질 끝페이지
        int totalPage;//총 페이지수
        int no;//각 페이지당 출력할 시작번호

        //총 페이지수를 구한다
        //총글의갯수/한페이지당보여질갯수로 나눔(7/5=1)
        //나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
        totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

        //각 블럭당 보여질 시작페이지
        //perBlock=5 일경우 현재페이지가 1~5 일경우는 시작페이지가 1, 끝페이지가 5
        //만약 현재페이지가 13 일경우는 시작페이지가 11, 끝페이지가 15
        startPage = (currentPage - 1) / perBlock * perBlock + 1;
        endPage = startPage + perBlock - 1;

        //총페이지수가 23개일경우 마지막 블럭은 끝페이지가 25가 아니라 23이라야한다
        if (endPage > totalPage)
            endPage = totalPage;


        //각 페이지에서 보여질 시작번호
        //예: 1페이지->0, 2페이지:5, 3페이지 : 10...
        startNum = (currentPage - 1) * perPage;

        //각페이지당 출력할 시작번호 구하기
        //예: 총글갯수가 23이라면  1페이지는 23,2페이지는 18,3페이지는 13...
        no = totalCount - (currentPage - 1) * perPage;
        List<TripDto> list = tripService.selectPagingList(tc, tw, startNum, perPage, gu);

        for (TripDto dto : list) {
            int answercount = commentCourseService.selectTripstar(dto.getTrip_num()).size();
            dto.setAnswercount(answercount);
            double staravg = commentCourseService.selectTripStarAvg(dto.getTrip_num());
            dto.setStaravg(staravg);
            int substotal=subsService.selectTotalSubsTrip(dto.getTrip_num());
            dto.setSubstotal(substotal);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("totalCount", totalCount);
        map.put("currentPage", currentPage);
        map.put("startPage", startPage);
        map.put("endPage", endPage);
        map.put("no", no);
        map.put("totalPage", totalPage);
        map.put("findcolumn",tc);
        map.put("findword",tw);
        map.put("gu",gu);
        return map;
    }

    @GetMapping("/course/tripdetail")
    public ModelAndView tripdetail(int trip_num, int currentPage) {
        ModelAndView mview = new ModelAndView();
        //조회수 증가
        tripService.updateReadCount(trip_num);
        //num에 해당하는 dto 얻기
        TripDto dto = tripService.selectByNum(trip_num);

        mview.addObject("dto", dto);
        mview.addObject("currentPage", currentPage);
//        mview.addObject("memphoto", memphoto);
        mview.setViewName("/bit/course/tripdetail");
        return mview;
    }

}
