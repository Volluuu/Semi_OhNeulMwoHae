package bit.data.service;

import bit.data.dto.*;

import java.util.List;
import java.util.Map;

public interface FindServiceInter {
    public int selectTotalCount(String findcolumn, String findword);
    public List<FindDto> findPagingList(String findcolumn, String findword, int startNum, int perPage);
    public UserDto selectUserByfindNum(int find_num);
    public FindDto selectByNum(int find_num);
    public void insertFindBoard(FindDto dto);
    public void updateReadCount(int find_num);
    public void updateFindBoard(FindDto dto);
    public void deleteFindBoard(int find_num);

    public List<CafeDto> selectCafeData(String cword);
    public List<TripDto> selectTripData(String cword);
    public List<FoodDto> selectFoodData(String cword);

    public List<CourseDto> selectMyCourse(int user_num);

    public CafeDto selectCafeByNum(int cafe_num);
    public TripDto selectTripByNum(int trip_num);
    public FoodDto selectFoodByNum(int food_num);

    public List<FindDto> selectTopList(int count);
}
