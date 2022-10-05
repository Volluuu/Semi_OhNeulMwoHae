package bit.data.controller;

import bit.data.dto.*;
import bit.data.service.CafeServiceInter;
import bit.data.service.CommentCourseServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommentCourseController {
    @Autowired
    CommentCourseServiceInter commentCourseService;

    @Autowired
    CafeServiceInter cafeService;


    @GetMapping("/course/cafedetail")
    public ModelAndView cafedetail(int cafe_num, int currentPage) {
        ModelAndView mview = new ModelAndView();
        //조회수 증가
        cafeService.updateReadCount(cafe_num);
        //num에 해당하는 dto 얻기
        CafeDto dto=cafeService.selectByNum(cafe_num);

        mview.addObject("dto", dto);
        mview.addObject("currentPage", currentPage);
        mview.setViewName("/bit/course/cafedetail");
        return mview;
    }
    @GetMapping("/course/cafedetaillist")
    @ResponseBody
    public List<CommentCourseDto> commentcafelist(int cafe_num){
        return commentCourseService.selectCafeStar(cafe_num);
    }



    @GetMapping("/commentcourse/cafestar")
    @ResponseBody
    public void cafestar(int user_num,int star, int cafe_num, String content){

        commentCourseService.insertCafeStar(user_num,star,cafe_num,content);
    }

}
