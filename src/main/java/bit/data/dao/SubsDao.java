package bit.data.dao;

import bit.data.dto.CafeDto;
import bit.data.dto.FoodDto;
import bit.data.dto.SubsDto;
import bit.data.dto.TripDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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
}
