package bit.data.dao;

import bit.data.dto.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class AdminDao implements AdminDaoInter{

    @Autowired
    SqlSession session;

    String ns="bit.data.dao.AdminDao.";

    @Override
    public int getTotalCount(Map<String, String> map) {
        return session.selectOne(ns+"getTotalCount",map);
    }

    @Override
    public void deleteUserByNum(int user_num) { session.delete(ns+"deleteUserByNum",user_num);

    }

    @Override
    public List<QnaDto> getAllData() {
        return session.selectList(ns+"getAllData");
    }

    @Override
    public int selectCafeTotalCount() {
        return session.selectOne(ns+"selectCafeTotalCount");
    }

    @Override
    public int selectFoodTotalCount() {
        return session.selectOne(ns+"selectFoodTotalCount");
    }

    @Override
    public int selectTripTotalCount() {
        return session.selectOne(ns+"selectTripTotalCount");
    }

    @Override
    public int qnaNotAnswer() {
        return session.selectOne(ns+"qnaNotAnswer");
    }

    @Override
    public int todayReview() {
        return session.selectOne(ns+"todayReview");
    }

    @Override
    public List<UserDto> userInfo() {
        return session.selectList(ns+"userInfo");
    }

    @Override
    public List<UserDto> getUserPaging(Map<String, Object> map) {
        return session.selectList(ns+"getUserPaging",map);
    }

    @Override
    public List<CafeDto> getCafePaging(Map<String, Object> map) {
        return session.selectList(ns+"getCafePaging",map);
    }

    @Override
    public int getCafeTotal(Map<String, String> map) {
        return session.selectOne(ns+"getCafeTotal",map);
    }

    @Override
    public List<FoodDto> getFoodPaging(Map<String, Object> map) {
        return session.selectList(ns+"getFoodPaging",map);
    }

    @Override
    public int getFoodTotal(Map<String, String> map) {
        return session.selectOne(ns+"getFoodTotal",map);
    }

    @Override
    public List<TripDto> getTripPaging(Map<String, Object> map) {
        return session.selectList(ns+"getTripPaging",map);
    }

    @Override
    public int getTripTotal(Map<String, String> map) {
        return session.selectOne(ns+"getTripTotal",map);
    }
}
