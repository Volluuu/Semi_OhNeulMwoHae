package bit.data.controller;

import bit.data.dto.CafeDto;
import bit.data.dto.FoodDto;
import bit.data.dto.SubsDto;
import bit.data.dto.TripDto;
import bit.data.service.SubsServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SubsController {

    @Autowired
    SubsServiceInter subsService;


    @GetMapping("/subs/myplace")
    @ResponseBody
    public List<SubsDto> selectAllSubs(int user_num){
        List<SubsDto> list=subsService.selectAllSubs(user_num);

        return list;
    }

//    @GetMapping("/myplace/food")
//    @ResponseBody
//    public List<FoodDto> selectFoodData(int food_num){
//        System.out.println("food_num:"+food_num);
//        List<FoodDto> list=subsService.selectFoodData(food_num);
//
//        return list;
//    }
//
//    @GetMapping("/myplace/trip")
//    @ResponseBody
//    public List<TripDto> selectTripData(int trip_num){
//        System.out.println("trip_num:"+trip_num);
//        List<TripDto> list=subsService.selectTripData(trip_num);
//
//        return list;
//    }
//    @GetMapping("/myplace/cafe")
//    @ResponseBody
//    public List<CafeDto> selectCafeData(int cafe_num){
//        System.out.println("cafe_num:"+cafe_num);
//        List<CafeDto> list=subsService.selectCafeData(cafe_num);
//
//        return list;
//    }

    @GetMapping("/myplace/food")
    @ResponseBody
    public FoodDto selectFoodData(int food_num){
        FoodDto dto=subsService.selectFoodData(food_num);

        return dto;
    }

    @GetMapping("/myplace/trip")
    @ResponseBody
    public TripDto selectTripData(int trip_num){
        TripDto dto=subsService.selectTripData(trip_num);

        return dto;
    }
    @GetMapping("/myplace/cafe")
    @ResponseBody
    public CafeDto selectCafeData(int cafe_num){
        CafeDto dto=subsService.selectCafeData(cafe_num);

        return dto;
    }

    @GetMapping("/cafedetail/insertsubs")
    @ResponseBody
    public Map<String, Integer> cafeInsertSubs(int user_num, int cafe_num){
        Map<String, Integer> map=new HashMap<>();
        subsService.insertCafeSubs(user_num, cafe_num);
        int totalsubs=subsService.selectTotalSubsCafe(cafe_num);
        map.put("totalsubs",totalsubs);
        return map;
    }

    @GetMapping("/cafedetail/deletesubs")
    @ResponseBody
    public Map<String, Integer> cafeDeleteSubs(int user_num, int cafe_num){
        Map<String, Integer> map=new HashMap<>();
        subsService.deleteCafeSubs(user_num, cafe_num);
        int totalsubs=subsService.selectTotalSubsCafe(cafe_num);
        map.put("totalsubs",totalsubs);
        return map;
    }

    @GetMapping("/fooddetail/insertsubs")
    @ResponseBody
    public Map<String, Integer> foodInsertSubs(int user_num, int food_num){
        Map<String, Integer> map=new HashMap<>();
        subsService.insertFoodSubs(user_num, food_num);
        int totalsubs=subsService.selectTotalSubsFood(food_num);
        map.put("totalsubs",totalsubs);
        return map;
    }

    @GetMapping("/fooddetail/deletesubs")
    @ResponseBody
    public Map<String, Integer> foodDeleteSubs(int user_num, int food_num){
        Map<String, Integer> map=new HashMap<>();
        subsService.deleteFoodSubs(user_num, food_num);
        int totalsubs=subsService.selectTotalSubsFood(food_num);
        map.put("totalsubs",totalsubs);
        return map;
    }

    @GetMapping("/tripdetail/insertsubs")
    @ResponseBody
    public Map<String, Integer> tripInsertSubs(int user_num, int trip_num){
        Map<String, Integer> map=new HashMap<>();
        subsService.insertTripSubs(user_num, trip_num);
        int totalsubs=subsService.selectTotalSubsTrip(trip_num);
        map.put("totalsubs",totalsubs);
        return map;
    }
    @GetMapping("/tripdetail/deletesubs")
    @ResponseBody
    public Map<String, Integer> tripDeleteSubs(int user_num, int trip_num){
        Map<String, Integer> map=new HashMap<>();
        subsService.deleteTripSubs(user_num, trip_num);
        int totalsubs=subsService.selectTotalSubsTrip(trip_num);
        map.put("totalsubs",totalsubs);
        return map;
    }

}
