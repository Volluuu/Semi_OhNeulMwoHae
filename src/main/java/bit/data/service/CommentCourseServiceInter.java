package bit.data.service;

import bit.data.dto.CommentCourseDto;

import java.util.List;

public interface CommentCourseServiceInter {
    public List<CommentCourseDto> selectCafeStar(int cafe_num);
    public void insertCafeStar(int user_num,int star, int cafe_num, String content);
}
