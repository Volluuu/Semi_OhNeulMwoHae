package bit.data.controller;

import bit.data.dto.*;
import bit.data.service.CafeServiceInter;
import bit.data.service.CommentCourseServiceInter;
import bit.data.service.SubsServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommentCourseController {
    @Autowired
    CommentCourseServiceInter commentCourseService;

    @Autowired
    CafeServiceInter cafeService;

    @Autowired
    SubsServiceInter subsService;

    @GetMapping("/course/cafedetailanswer")
    @ResponseBody
    public Map<String, Object> commentCafeAnswer(int cafe_num, @RequestParam(value = "user_num", required = false) String user_num){
        if(user_num==""){
            user_num="0";
        }
        List<CommentCourseDto> list=commentCourseService.selectCafeStar(cafe_num);
        Map<String, Object> map=new HashMap<>();
        int subs=subsService.selectCafeSubs(Integer.parseInt(user_num), cafe_num);
        map.put("subs",subs);
        map.put("list",list);
        return map;
    }

    @GetMapping("/course/fooddetailanswer")
    @ResponseBody
    public Map<String, Object> commentFoodAnswer(int food_num, @RequestParam(value = "user_num", required = false) String user_num){
        if(user_num==""){
            user_num="0";
        }
        List<CommentCourseDto> list=commentCourseService.selectFoodStar(food_num);
        Map<String, Object> map=new HashMap<>();
        int subs=subsService.selectFoodSubs(Integer.parseInt(user_num), food_num);
        map.put("subs",subs);
        map.put("list",list);
        return map;
    }

    @GetMapping("/course/tripdetailanswer")
    @ResponseBody
    public Map<String, Object> commentTripAnswer(int trip_num, @RequestParam(value = "user_num", required = false) String user_num){
        if(user_num==""){
            user_num="0";
        }
        List<CommentCourseDto> list=commentCourseService.selectTripstar(trip_num);
        Map<String, Object> map=new HashMap<>();
        int subs=subsService.selectFoodSubs(Integer.parseInt(user_num), trip_num);
        map.put("subs",subs);
        map.put("list",list);
        return map;
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
