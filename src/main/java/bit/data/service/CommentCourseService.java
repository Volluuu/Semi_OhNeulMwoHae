package bit.data.service;

import bit.data.dao.CommentCourseDaoInter;
import bit.data.dto.CommentCourseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class CommentCourseService implements CommentCourseServiceInter {
    @Autowired
    CommentCourseDaoInter commentCourseDao;


    @Override
    public List<CommentCourseDto> selectCafeStar(int cafe_num) {
        return commentCourseDao.selectCafeStar(cafe_num);
    }

    @Override
    public void insertCafeStar(int user_num,int star, int cafe_num, String content) {
        Map<String, Object> map=new HashMap<>();
        map.put("user_num",user_num);
        map.put("star",star);
        map.put("cafe_num",cafe_num);
        map.put("content",content);
        commentCourseDao.insertCafeStar(map);
    }
}
