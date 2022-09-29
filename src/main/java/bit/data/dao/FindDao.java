package bit.data.dao;

import bit.data.dto.FindDto;
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
    public FindDto selectByNum(int num) {
        return session.selectOne(ns+"selectByNum", num);
    }

    @Override
    public void insertFindBoard(FindDto dto) {
        session.insert(ns+"insertFindBoard", dto);
    }

    @Override
    public void updateReadCount(int num) {
        session.update(ns+"updateReadCount", num);
    }

    @Override
    public void updateFindBoard(FindDto dto) {
        session.update(ns+"updateFindBoard", dto);
    }

    @Override
    public void deleteFindBoard(int num) {
        session.delete(ns+"deleteFindBoard", num);
    }
}
