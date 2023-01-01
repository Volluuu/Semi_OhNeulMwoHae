package com.bit.semi;

import bit.data.dto.CafeDto;
import bit.data.dto.FindDto;
import bit.data.dto.FoodDto;
import bit.data.dto.TripDto;
import bit.data.service.CafeServiceInter;
import bit.data.service.FindServiceInter;
import bit.data.service.FoodServiceInter;
import bit.data.service.TripServiceInter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
public class HomeController {
    @Autowired
    private CafeServiceInter cafeService;
    @Autowired
    private FoodServiceInter foodService;
    @Autowired
    private TripServiceInter tripService;
    @Autowired
    private FindServiceInter findService;

    @GetMapping("/")
    public ModelAndView index(Model model) throws Exception {
        ModelAndView mview = new ModelAndView();
        mview.setViewName("/bit3/layout/index");
        return mview;
    }


    @GetMapping("/home")
    public ModelAndView home(Model model) throws Exception {
        ModelAndView mview = new ModelAndView();

        List<CafeDto> cafeTopList = cafeService.selectTopList(3);
        List<FoodDto> foodTopList = foodService.selectTopList(3);
        List<TripDto> tripTopList = tripService.selectTopList(3);


        log.info("cafeTopList : " + cafeTopList.size());
        log.info("foodTopList : " + foodTopList.size());
        log.info("tripTopList : " + tripTopList.size());

        mview.addObject("cafeTopList", cafeTopList);
        mview.addObject("foodTopList", foodTopList);
        mview.addObject("tripTopList", tripTopList);

        List<FindDto> findTopList = findService.selectTopList(3);
        mview.addObject("findTopList", findTopList);


        mview.setViewName("/bit/layout/main");
        return mview;

    }
}