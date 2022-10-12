package bit.data.service;


import bit.data.dao.*;
import bit.data.dto.*;
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

    public int getTotalCount(String searchcolumn, String searchword) {
        Map<String, String> map=new HashMap<>();
        map.put("searchcolumn",searchcolumn);
        map.put("searchword",searchword);
        return admindao.getTotalCount(map);
    }

    @Override
    public void deleteUserByNum(int user_num) {
        admindao.deleteUserByNum(user_num);

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

    @Override
    public List<UserDto> getUserPaging(String searchcolumn, String searchword, int startnum, int perpage) {
        Map<String, Object> map=new HashMap<>();
        map.put("searchcolumn",searchcolumn);
        map.put("searchword",searchword);
        map.put("startnum",startnum);
        map.put("perpage",perpage);
        return admindao.getUserPaging(map);
    }

    @Override
    public List<CafeDto> getCafePaging(String searchcolumn, String searchword, int startnum, int perpage) {
        Map<String, Object> map=new HashMap<>();
        map.put("searchcolumn",searchcolumn);
        map.put("searchword",searchword);
        map.put("startnum",startnum);
        map.put("perpage",perpage);
        return admindao.getCafePaging(map);
    }

    @Override
    public int getCafeTotal(String searchcolumn, String searchword) {
        Map<String, String> map=new HashMap<>();
        map.put("searchcolumn",searchcolumn);
        map.put("searchword",searchword);
        return admindao.getCafeTotal(map);
    }

    @Override
    public void cafeUpdAct(CafeDto dto) {
        admindao.cafeUpdAct(dto);
    }

    @Override
    public void deleteCafeByNum(int cafe_num) {
        admindao.deleteCafeByNum(cafe_num);
    }

    @Override
    public List<FoodDto> getFoodPaging(String searchcolumn, String searchword, int startnum, int perpage) {
        Map<String, Object> map=new HashMap<>();
        map.put("searchcolumn",searchcolumn);
        map.put("searchword",searchword);
        map.put("startnum",startnum);
        map.put("perpage",perpage);
        return admindao.getFoodPaging(map);
    }

    @Override
    public int getFoodTotal(String searchcolumn, String searchword) {
        Map<String, String> map=new HashMap<>();
        map.put("searchcolumn",searchcolumn);
        map.put("searchword",searchword);
        return admindao.getFoodTotal(map);
    }

    @Override
    public void foodUpdAct(FoodDto dto) {
        admindao.foodUpdAct(dto);
    }

    @Override
    public void deleteFoodByNum(int food_num) {
        admindao.deleteFoodByNum(food_num);
    }

    @Override
    public List<TripDto> getTripPaging(String searchcolumn, String searchword, int startnum, int perpage) {
        Map<String, Object> map=new HashMap<>();
        map.put("searchcolumn",searchcolumn);
        map.put("searchword",searchword);
        map.put("startnum",startnum);
        map.put("perpage",perpage);
        return admindao.getTripPaging(map);
    }

    @Override
    public int getTripTotal(String searchcolumn, String searchword) {
        Map<String, String> map=new HashMap<>();
        map.put("searchcolumn",searchcolumn);
        map.put("searchword",searchword);
        return admindao.getTripTotal(map);
    }

    @Override
    public void tripUpdAct(TripDto dto) {
        admindao.tripUpdAct(dto);
    }

    @Override
    public void deleteTripByNum(int trip_num) {
        admindao.deleteTripByNum(trip_num);
    }

    @Override
    public void cafeInsertAct(CafeDto dto) {
        admindao.cafeInsertAct(dto);
    }

    @Override
    public void foodInsertAct(FoodDto dto) {
        admindao.foodInsertAct(dto);

    }

    @Override
    public void tripInsertAct(TripDto dto) {
        admindao.tripInsertAct(dto);
    }
}
