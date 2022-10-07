package bit.data.dao;

import bit.data.dto.CommentCourseDto;

import java.util.List;
import java.util.Map;

public interface CommentCourseDaoInter {
    public List<CommentCourseDto> selectCafeStar(int cafe_num);
    public void insertCafeStar(Map<String,Object> map);
    public double selectCafeStarAvg(int cafe_num);

    public List<CommentCourseDto> selectFoodStar(int food_num);
    public void insertFoodStar(Map<String,Object> map);
    public double selectFoodStarAvg(int food_num);
    public List<CommentCourseDto> selectTripstar(int trip_num);
    public void insertTripStar(Map<String,Object> map);
    public double selectTripStarAvg(int trip_num);


}
