package bit.data.dao;

import bit.data.dto.CafeDto;
import bit.data.dto.FoodDto;
import bit.data.dto.SubsDto;
import bit.data.dto.TripDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class SubsDao implements SubsDaoInter{

    @Autowired
    SqlSession session;

    String ns="bit.data.dao.SubsDao.";

    @Override
    public List<SubsDto> selectAllSubs(int user_num) {
        return session.selectList(ns+"selectAllSubs", user_num);
    }

//    @Override
//    public List<FoodDto> selectFoodData(int food_num) {
//        return session.selectList(ns+"selectFoodData",food_num);
//    }
//
//    @Override
//    public List<TripDto> selectTripData(int trip_num) {
//        return session.selectList(ns+"selectTripData",trip_num);
//    }
//
//    @Override
//    public List<CafeDto> selectCafeData(int cafe_num) {
//        return session.selectList(ns+"selectCafeData",cafe_num);
//    }


    @Override
    public FoodDto selectFoodData(int food_num) {
        return session.selectOne(ns+"selectFoodData",food_num);
    }

    @Override
    public TripDto selectTripData(int trip_num) {
        return session.selectOne(ns+"selectTripData",trip_num);
    }

    @Override
    public CafeDto selectCafeData(int cafe_num) {
        return session.selectOne(ns+"selectCafeData",cafe_num);
    }

    @Override
    public void insertFoodSubs(Map<String, Integer> map) {
        session.insert(ns+"insertFoodSubs",map);
    }

    @Override
    public void insertTripSubs(Map<String, Integer> map) {
        session.insert(ns+"insertTripSubs",map);
    }

    @Override
    public void insertCafeSubs(Map<String, Integer> map) {
        session.insert(ns+"insertCafeSubs",map);
    }

    @Override
    public void deleteFoodSubs(Map<String, Integer> map) {
        session.delete(ns+"deleteFoodSubs",map);

    }

    @Override
    public void deleteTripSubs(Map<String, Integer> map) {
        session.delete(ns+"deleteTripSubs",map);
    }

    @Override
    public void deleteCafeSubs(Map<String, Integer> map) {
        session.delete(ns+"deleteCafeSubs",map);
    }

    @Override
    public int selectTotalSubsCafe(int cafe_num) {
        return session.selectOne(ns+"selectTotalSubsCafe",cafe_num);
    }

    @Override
    public int selectTotalSubsFood(int food_num) {
        return session.selectOne(ns+"selectTotalSubsFood",food_num);
    }

    @Override
    public int selectTotalSubsTrip(int trip_num) {
        return session.selectOne(ns+"selectTotalSubsTrip",trip_num);
    }

    @Override
    public int selectCafeSubs(Map<String, Integer> map) {
        return session.selectOne(ns+"selectCafeSubs",map);
    }

    @Override
    public int selectFoodSubs(Map<String, Integer> map) {
        return session.selectOne(ns+"selectFoodSubs",map);
    }

    @Override
    public int selectTripSubs(Map<String, Integer> map) {
        return session.selectOne(ns+"selectTripSubs",map);
    }

}
