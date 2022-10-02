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

import java.util.List;

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

}
