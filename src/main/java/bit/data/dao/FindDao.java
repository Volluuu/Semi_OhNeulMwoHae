package bit.data.dao;

import bit.data.dto.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class FindDao implements FindDaoInter{

    @Autowired
    SqlSession session;
    String ns="bit.data.dao.FindDao.";

    @Override
    public int selectTotalCount(Map<String, String> map) {
        return session.selectOne(ns+"selectTotalCount", map);
    }

    @Override
    public List<FindDto> findPagingList(Map<String, Object> map) {
        return session.selectList(ns+"findPagingList", map);
    }

    @Override
    public UserDto selectUserByfindNum(int find_num) {
        return session.selectOne(ns+"selectUserByfindNum", find_num);
    }

    @Override
    public FindDto selectByNum(int find_num) {
        return session.selectOne(ns+"selectByNum", find_num);
    }

    @Override
    public void insertFindBoard(FindDto dto) {
        session.insert(ns+"insertFindBoard", dto);
    }

    @Override
    public void updateReadCount(int find_num) {
        session.update(ns+"updateReadCount", find_num);
    }

    @Override
    public void updateFindBoard(FindDto dto) {
        session.update(ns+"updateFindBoard", dto);
    }

    @Override
    public void deleteFindBoard(int find_num) {
        session.delete(ns+"deleteFindBoard", find_num);
    }

    @Override
    public List<CafeDto> selectCafeData(String cword) {
        return session.selectList(ns+"selectCafeData", cword);
    }

    @Override
    public List<TripDto> selectTripData(String cword) {
        return session.selectList(ns+"selectTripData", cword);
    }

    @Override
    public List<FoodDto> selectFoodData(String cword) {
        return session.selectList(ns+"selectFoodData", cword);
    }

    @Override
    public List<CourseDto> selectMyCourse(int user_num) {
        return session.selectList(ns+"selectMyCourse",user_num);
    }
}
