package bit.data.service;

import bit.data.dto.CafeDto;
import bit.data.dto.FoodDto;
import bit.data.dto.SubsDto;
import bit.data.dto.TripDto;

import java.util.List;
import java.util.Map;

public interface SubsServiceInter {

    public List<SubsDto> selectAllSubs(int user_num);

//    public List<FoodDto> selectFoodData(int food_num);
//    public List<TripDto> selectTripData(int trip_num);
//    public List<CafeDto> selectCafeData(int cafe_num);

    public FoodDto selectFoodData(int food_num);
    public TripDto selectTripData(int trip_num);
    public CafeDto selectCafeData(int cafe_num);

    public void insertFoodSubs(int user_num, int food_num);
    public void insertTripSubs(int user_num, int trip_num);
    public void insertCafeSubs(int user_num, int cafe_num);
    public void deleteFoodSubs(int user_num, int food_num);
    public void deleteTripSubs(int user_num, int trip_num);
    public void deleteCafeSubs(int user_num, int cafe_num);
    public int selectTotalSubsCafe(int cafe_num);
    public int selectTotalSubsFood(int food_num);
    public int selectTotalSubsTrip(int trip_num);
    public int selectCafeSubs(int user_num, int cafe_num);
    public int selectFoodSubs(int user_num, int food_num);
    public int selectTripSubs(int user_num, int trip_num);
}
