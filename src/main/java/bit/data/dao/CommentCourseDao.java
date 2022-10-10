package bit.data.dao;

import bit.data.dto.CommentCourseDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CommentCourseDao implements CommentCourseDaoInter {

    @Autowired
    SqlSession session;

    String ns="bit.data.dao.CommentCourseDao.";

    @Override
    public List<CommentCourseDto> selectCafeStar(int cafe_num) {
        return session.selectList(ns+"selectCafeStar",cafe_num);
    }

    @Override
    public void insertCafeStar(Map<String,Object> map) {
        session.insert(ns+"insertCafeStar",map);
    }

    @Override
    public double selectCafeStarAvg(int cafe_num) {
        return session.selectOne(ns+"selectCafeStarAvg",cafe_num);
    }

    @Override
    public List<CommentCourseDto> selectFoodStar(int food_num) {
        return session.selectList(ns+"selectFoodStar",food_num);
    }

    @Override
    public void insertFoodStar(Map<String, Object> map) {
        session.insert(ns+"insertFoodStar",map);
    }

    @Override
    public double selectFoodStarAvg(int food_num) {
        return session.selectOne(ns+"selectFoodStarAvg",food_num);
    }

    @Override
    public List<CommentCourseDto> selectTripstar(int trip_num) {
        return session.selectList(ns+"selectTripStar",trip_num);
    }

    @Override
    public void insertTripStar(Map<String, Object> map) {
        session.insert(ns+"insertTripStar",map);
    }

    @Override
    public double selectTripStarAvg(int trip_num) {
        return session.selectOne(ns+"selectTripStarAvg",trip_num);
    }


}
