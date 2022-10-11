package bit.data.service;


import bit.data.dao.*;
import bit.data.dto.QnaDto;
import bit.data.dto.UserDto;
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

    @Autowired
    AdminDaoInter admindao;

    @Override
    public int getTotalCount() {
        return admindao.getTotalCount();
    }

    @Override
    public List<QnaDto> getAllData() {
        return null;
    }

    @Override
    public int selectCafeTotalCount() {
        return admindao.selectCafeTotalCount();
    }

    @Override
    public int selectFoodTotalCount() {
        return admindao.selectFoodTotalCount();
    }

    @Override
    public int selectTripTotalCount() {
        return admindao.selectTripTotalCount();
    }

    @Override
    public int qnaNotAnswer() {
        return admindao.qnaNotAnswer();
    }

    @Override
    public int todayReview() {
        return admindao.todayReview();
    }

    @Override
    public List<UserDto> userInfo() {
        return admindao.userInfo();
    }
}
