package bit.data.dao;

import bit.data.dto.FoodDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class FoodDao implements FoodDaoInter{

    @Autowired
    SqlSession session;

    String ns="bit.data.dao.FoodDao.";

    @Override
    public int selectTotalCount(Map<String, String> map) {
        return session.selectOne(ns+"selectTotalCount", map);
    }

    @Override
    public List<FoodDto> selectPagingList(Map<String, Object> map) {
        return session.selectList(ns+"selectPagingList",map);
    }

    @Override
    public FoodDto getFoodData(int food_num) {
        return session.selectOne(ns+"getFoodData",food_num);
    }

    @Override
    public void insertFood(FoodDto dto) {
        session.insert(ns+"insertFood",dto);
    }

    @Override
    public void updateReadCount(int food_num) {
        session.update(ns+"updateReadCount", food_num);
    }

    @Override
    public void deleteFood(int food_num) {
        session.delete(ns+"deleteFood", food_num);
    }

    @Override
    public void updateFood(FoodDto dto) {
        session.update(ns+"updateFood", dto);
    }

    @Override
    public void likesInsert(int food_num) {
        session.insert(ns+"likesInsert", food_num);
    }

    @Override
    public void likesUpdate(int food_num) {
        session.update(ns+"likesUpdate", food_num);
    }

    @Override
    public FoodDto selectByNum(int food_num) {
        return session.selectOne(ns+"selectByNum",food_num);
    }
}
