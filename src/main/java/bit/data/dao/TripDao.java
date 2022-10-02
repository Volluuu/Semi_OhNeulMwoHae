package bit.data.dao;

import bit.data.dto.TripDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class TripDao implements TripDaoInter{

    @Autowired
    SqlSession session;

    String ns="bit.data.dao.TripDao.";

    @Override
    public int selectTotalCount(Map<String, String> map) {
        return session.selectOne(ns+"selectTotalCount", map);
    }

    @Override
    public TripDto getFoodData(int trip_num) {
        return session.selectOne(ns+"getFoodData", trip_num);
    }

    @Override
    public List<TripDto> selectPagingList(Map<String, Object> map) {
        return session.selectList(ns+"selectPagingList", map);
    }

    @Override
    public void insertTrip(TripDto dto) {
        session.insert(ns+"insertTrip", dto);
    }

    @Override
    public void updateReadCount(int trip_num) {
        session.update(ns+"updateReadCount", trip_num);
    }

    @Override
    public void deleteTrip(int trip_num) {
        session.delete(ns+"deleteTrip", trip_num);
    }

    @Override
    public void updateTrip(TripDto dto) {
        session.update(ns+"updateTrip", dto);
    }

    @Override
    public void likesInsert(int trip_num) {
        session.insert(ns+"likesInsert", trip_num);
    }

    @Override
    public void likesUpdate(int trip_num) {
        session.update(ns+"likesUpdate", trip_num);
    }
}
