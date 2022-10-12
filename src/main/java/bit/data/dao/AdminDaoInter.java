package bit.data.dao;

import bit.data.dto.*;

import java.util.List;
import java.util.Map;

public interface AdminDaoInter {
    public int getTotalCount(Map<String, String> map);
    public void deleteUserByNum(int user_num);
    public List<QnaDto> getAllData();
    public int selectCafeTotalCount();
    public int selectFoodTotalCount();
    public int selectTripTotalCount();
    public int qnaNotAnswer();

    public int todayReview();
    public List<UserDto> userInfo();
    public List<UserDto> getUserPaging(Map<String, Object> map);

    public void cafeUpdAct(CafeDto dto);
    public void foodUpdAct(FoodDto dto);
    public void tripUpdAct(TripDto dto);

    public List<CafeDto> getCafePaging(Map<String, Object> map);
    public List<FoodDto> getFoodPaging(Map<String, Object> map);
    public List<TripDto> getTripPaging(Map<String, Object> map);

    public int getCafeTotal(Map<String, String> map);
    public int getFoodTotal(Map<String, String> map);
    public int getTripTotal(Map<String, String> map);

    public void deleteCafeByNum(int cafe_num);
    public void deleteFoodByNum(int food_num);
    public void deleteTripByNum(int trip_num);

    public void cafeInsertAct(CafeDto dto);
    public void foodInsertAct(FoodDto dto);
    public void tripInsertAct(TripDto dto);

}
