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
}
