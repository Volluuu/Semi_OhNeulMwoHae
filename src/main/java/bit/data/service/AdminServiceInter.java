package bit.data.service;

import bit.data.dto.*;

import java.util.List;
import java.util.Map;

public interface AdminServiceInter {
    public int getTotalCount(String searchcolumn, String searchword);

    public void deleteUserByNum(int user_num);
    public List<QnaDto> getAllData();
    public int selectCafeTotalCount();
    public int selectFoodTotalCount();
    public int selectTripTotalCount();

    public int qnaNotAnswer();
    public int todayReview();
    public List<UserDto> userInfo();
    public List<UserDto> getUserPaging(String searchcolumn, String searchword, int startnum, int perpage);
    public List<CafeDto> getCafePaging(String searchcolumn, String searchword, int startnum, int perpage);
    public int getCafeTotal(String searchcolumn, String searchword);
    public void cafeUpdAct(CafeDto dto);
    public void deleteCafeByNum(int cafe_num);
    public List<FoodDto> getFoodPaging(String searchcolumn, String searchword, int startnum, int perpage);
    public int getFoodTotal(String searchcolumn, String searchword);
    public void foodUpdAct(FoodDto dto);
    public void deleteFoodByNum(int food_num);
    public List<TripDto> getTripPaging(String searchcolumn, String searchword, int startnum, int perpage);
    public int getTripTotal(String searchcolumn, String searchword);
    public void tripUpdAct(TripDto dto);
    public void deleteTripByNum(int trip_num);

    public void cafeInsertAct(CafeDto dto);
    public void foodInsertAct(FoodDto dto);
    public void tripInsertAct(TripDto dto);

}
