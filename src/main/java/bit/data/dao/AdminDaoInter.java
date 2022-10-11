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
    public List<CafeDto> getCafePaging(Map<String, Object> map);
    public int getCafeTotal(Map<String, String> map);
    public List<FoodDto> getFoodPaging(Map<String, Object> map);
    public int getFoodTotal(Map<String, String> map);
    public List<TripDto> getTripPaging(Map<String, Object> map);
    public int getTripTotal(Map<String, String> map);
}
