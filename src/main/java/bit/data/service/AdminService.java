package bit.data.service;


import bit.data.dao.*;
import bit.data.dto.QnaDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminService implements AdminServiceInter{

    @Autowired
    QnaDaoInter qnadao;

    @Autowired
    CafeDaoInter Cafedao;

    @Autowired
    TripDaoInter Tripdao;

    @Autowired
    FoodDaoInter Fooddao;

    @Override
    public int getTotalCount(Map<String, String> qnamap) {
        Map<String, String> map=new HashMap<String, String>();

        return qnadao.getTotalCount(qnamap);
    }

    @Override
    public List<QnaDto> getAllData() {
        return null;
    }

    @Override
    public int selectCafeTotalCount(Map<String, String> cafemap) {
        return 0;
    }

    @Override
    public int selectFoodTotalCount(Map<String, String> foodmap) {
        return 0;
    }

    @Override
    public int selectTripTotalCount(Map<String, String> tripmap) {
        return 0;
    }
}
