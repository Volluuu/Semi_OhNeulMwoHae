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

    @GetMapping("/course/cafedetailanswer")
    @ResponseBody
    public List<CommentCourseDto> commentCafeAnswer(int cafe_num){
        return commentCourseService.selectCafeStar(cafe_num);
    }

    @GetMapping("/course/fooddetailanswer")
    @ResponseBody
    public List<CommentCourseDto> commentFoodAnswer(int food_num){
        return commentCourseService.selectFoodStar(food_num);
    }

    @GetMapping("/course/tripdetailanswer")
    @ResponseBody
    public List<CommentCourseDto> commentTripAnswer(int trip_num){
        return commentCourseService.selectTripstar(trip_num);
    }

    @GetMapping("/commentcourse/cafestar")
    @ResponseBody
    public void cafestar(int user_num,int star, int cafe_num, String content){

        commentCourseService.insertCafeStar(user_num,star,cafe_num,content);
    }

    @GetMapping("/commentcourse/foodstar")
    @ResponseBody
    public void foodstar(int user_num,int star, int food_num, String content){

        commentCourseService.insertFoodStar(user_num,star,food_num,content);
    }

    @GetMapping("/commentcourse/tripstar")
    @ResponseBody
    public void tripstar(int user_num,int star, int trip_num, String content){

        commentCourseService.insertTripStar(user_num,star,trip_num,content);
    }

}
