package bit.data.dao;

import bit.data.dto.CommentCourseDto;

import java.util.List;
import java.util.Map;

public interface CommentCourseDaoInter {
    public List<CommentCourseDto> selectCafeStar(int cafe_num);
    public void insertCafeStar(Map<String,Object> map);
}
