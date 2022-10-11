package bit.data.dao;

import bit.data.dto.QnaDto;
import bit.data.dto.UserDto;
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
    public int getTotalCount() {
        return session.selectOne(ns+"getTotalCount");
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
}
