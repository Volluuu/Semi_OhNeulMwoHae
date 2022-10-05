package bit.data.service;

import bit.data.dto.CommentCourseDto;

import java.util.List;
import java.util.Map;

public interface CommentCourseServiceInter {
    public List<CommentCourseDto> selectCafeStar(int cafe_num);
    public void insertCafeStar(int user_num,int star, int cafe_num, String content);

    public double selectCafeStarAvg(int cafe_num);

    public List<CommentCourseDto> selectFoodStar(int food_num);
    public void insertFoodStar(int user_num,int star, int food_num, String content);
    public double selectFoodStarAvg(int food_num);

    public List<CommentCourseDto> selectTripstar(int trip_num);
    public void insertTripStar(int user_num,int star, int trip_num, String content);
    public double selectTripStarAvg(int trip_num);
}
