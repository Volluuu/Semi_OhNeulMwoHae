package bit.data.controller;

import bit.data.dto.CafeDto;
import bit.data.dto.FindDto;
import bit.data.dto.FoodDto;
import bit.data.dto.TripDto;
import bit.data.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
public class CafeController {

    @Autowired
    CafeServiceInter cafeService;
    @Autowired
    FoodServiceInter foodService;
    @Autowired
    TripServiceInter tripService;
    @Autowired
    SubsServiceInter subsService;

    @Autowired
    CommentCourseServiceInter commentCourseService;

    @GetMapping("/courseboard/list")
    public String cafeBoard(
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(value = "cafecolumn", required = false) String cc,
            @RequestParam(value = "cafeword", required = false) String cw,
            @RequestParam(defaultValue = "0") int gu,
            Model model)
    {
        //페이징 처리에 필요한 변수들
        //전체 갯수
        int CafetotalCount=cafeService.selectTotalCount(cc, cw, gu);
        int perPage=10;//한페이지당 보여질 글의 갯수
        int perBlock=5;//한블럭당 보여질 페이지의 갯수
        int CafestartNum;//db에서 가져올 글의 시작번호(mysql은 첫글이 0번,오라클은 1번)
        int CafestartPage;//각블럭당 보여질 시작페이지
        int CafeendPage;//각 블럭당 보여질 끝페이지
        int CafetotalPage;//총 페이지수
        int no;//각 페이지당 출력할 시작번호

        //총 페이지수를 구한다
        //총글의갯수/한페이지당보여질갯수로 나눔(7/5=1)
        //나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
        CafetotalPage=CafetotalCount/perPage+(CafetotalCount%perPage==0?0:1);

        //각 블럭당 보여질 시작페이지
        //perBlock=5 일경우 현재페이지가 1~5 일경우는 시작페이지가 1, 끝페이지가 5
        //만약 현재페이지가 13 일경우는 시작페이지가 11, 끝페이지가 15
        CafestartPage=(currentPage-1)/perBlock*perBlock+1;
        CafeendPage=CafestartPage+perBlock-1;

        //총페이지수가 23개일경우 마지막 블럭은 끝페이지가 25가 아니라 23이라야한다
        if(CafeendPage>CafetotalPage)
            CafeendPage=CafetotalPage;


        //각 페이지에서 보여질 시작번호
        //예: 1페이지->0, 2페이지:5, 3페이지 : 10...
        CafestartNum=(currentPage-1)*perPage;

        //각페이지당 출력할 시작번호 구하기
        //예: 총글갯수가 23이라면  1페이지는 23,2페이지는 18,3페이지는 13...
        no=CafetotalCount-(currentPage-1)*perPage;

        //페이지에서 보여질 글만 가져오기
        List<CafeDto> Cafelist=cafeService.selectPagingList(cc, cw, CafestartNum, perPage, gu);

        for (CafeDto dto : Cafelist) {
            int answercount = commentCourseService.selectCafeStar(dto.getCafe_num()).size();
            dto.setAnswercount(answercount);
            double staravg = commentCourseService.selectCafeStarAvg(dto.getCafe_num());
            dto.setStaravg(staravg);
            int substotal=subsService.selectTotalSubsCafe(dto.getCafe_num());
            dto.setSubstotal(substotal);
        }

        model.addAttribute("list", Cafelist);
        model.addAttribute("totalCount", CafetotalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", CafestartPage);
        model.addAttribute("endPage", CafeendPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", CafetotalPage);

        return "/bit/course/courseboard";
    }
    @GetMapping("/courseboard/cafelist")
    @ResponseBody
    public Map<String, Object> cafelist(
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(value = "cafecolumn", required = false) String cafecolumn,
            @RequestParam(value = "cafeword", required = false) String cafeword,
            @RequestParam(defaultValue = "0") int gu,
            Model model
    ) {
        int totalCount = cafeService.selectTotalCount(cafecolumn, cafeword, gu);
        int perPage = 10;//한페이지당 보여질 글의 갯수
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
        List<CafeDto> list = cafeService.selectPagingList(cafecolumn, cafeword, startNum, perPage, gu);

        for (CafeDto dto : list) {
            int answercount = commentCourseService.selectCafeStar(dto.getCafe_num()).size();
            dto.setAnswercount(answercount);
            double staravg = commentCourseService.selectCafeStarAvg(dto.getCafe_num());
            dto.setStaravg(staravg);
            int substotal=subsService.selectTotalSubsCafe(dto.getCafe_num());
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
        map.put("cafecolumn",cafecolumn);
        map.put("cafeword",cafeword);
        map.put("gu",gu);

        return map;
    }

    @GetMapping("/courseboard/cafelistgu")
    @ResponseBody
    public Map<String, Object> cafelistgu(
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(value = "cafecolumn", required = false) String cafecolumn,
            @RequestParam(value = "cafeword", required = false) String cafeword,
            @RequestParam(defaultValue = "0") int gu,
            Model model
    ) {
        int totalCount = cafeService.selectTotalCount(cafecolumn, cafeword, gu);
        int perPage = 10;//한페이지당 보여질 글의 갯수
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
        List<CafeDto> list = cafeService.selectPagingList(cafecolumn, cafeword, startNum, perPage, gu);

        for (CafeDto dto : list) {
            int answercount = commentCourseService.selectCafeStar(dto.getCafe_num()).size();
            dto.setAnswercount(answercount);
            double staravg = commentCourseService.selectCafeStarAvg(dto.getCafe_num());
            dto.setStaravg(staravg);
            int substotal=subsService.selectTotalSubsCafe(dto.getCafe_num());
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
        map.put("cafecolumn",cafecolumn);
        map.put("cafeword",cafeword);
        map.put("gu",gu);

        return map;
    }

    @GetMapping("/course/cafedetail")
    public ModelAndView cafedetail(int cafe_num, int currentPage) {
        ModelAndView mview = new ModelAndView();
        //조회수 증가
        cafeService.updateReadCount(cafe_num);
        //num에 해당하는 dto 얻기
        CafeDto dto = cafeService.selectByNum(cafe_num);

        mview.addObject("dto", dto);
        mview.addObject("currentPage", currentPage);
//        mview.addObject("memphoto", memphoto);
        mview.setViewName("/bit/course/cafedetail");
        return mview;
    }
}
