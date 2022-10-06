package bit.data.dao;

import bit.data.dto.QnaDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class AdminDao implements AdminDaoInter{

    @Autowired
    SqlSession session;

    String ns="bit.data.dao.CafeDao.";

    @Override
    public int getTotalCount(Map<String, String> qnamap) {
        return session.selectOne(ns+"getTotalCount", qnamap);
    }

    @Override
    public List<QnaDto> getAllData() {
        return session.selectList(ns+"getAllData");
    }

    @Override
    public int selectCafeTotalCount(Map<String, String> cafemap) {
        return session.selectOne(ns+"selectCafeTotalCount", cafemap);
    }

    @Override
    public int selectFoodTotalCount(Map<String, String> foodmap) {
        return session.selectOne(ns+"selectFoodTotalCount", foodmap);
    }

    @Override
    public int selectTripTotalCount(Map<String, String> tripmap) {
        return session.selectOne(ns+"selectTripTotalCount", tripmap);
    }
}
