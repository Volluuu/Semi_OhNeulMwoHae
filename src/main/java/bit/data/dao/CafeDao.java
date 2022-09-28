package bit.data.dao;

import bit.data.dto.CafeDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class CafeDao implements CafeDaoInter{
    @Autowired
    SqlSession session;

    String ns="bit.data.dao.Cafe.";

    @Override
    public int selectTotalCount(Map<String, String> map) {
        return session.selectOne(ns+"selectTotalCount", map);
    }

    @Override
    public void insertCafe(CafeDto dto) {
        session.insert(ns+"insertCafe",dto);
    }

    @Override
    public void updateReadCount(int cafe_num) {
        session.update(ns+"updateReadCount");
    }

    @Override
    public void deleteCafe(int cafe_num) {
        session.delete(ns+"deleteCafe");
    }

    @Override
    public void updateCafe(CafeDto dto) {
        session.update(ns+"updateCafe",dto);
    }

    @Override
    public void likesInsert(int cafe_num) {
        session.insert(ns+"likesInsert");
    }

    @Override
    public void likesUpdate(int cafe_num) {
        session.update(ns+"likesUpdate");
    }
}
