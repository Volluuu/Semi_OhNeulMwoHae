package bit.data.dao;

import bit.data.dto.CafeDto;
import bit.data.dto.FoodDto;
import bit.data.dto.SubsDto;
import bit.data.dto.TripDto;

import java.util.List;
import java.util.Map;

public interface SubsDaoInter {

    public List<SubsDto> selectAllSubs(int user_num);

//    public List<FoodDto> selectFoodData(int food_num);
//    public List<TripDto> selectTripData(int trip_num);
//    public List<CafeDto> selectCafeData(int cafe_num);

    public FoodDto selectFoodData(int food_num);
    public TripDto selectTripData(int trip_num);
    public CafeDto selectCafeData(int cafe_num);
    public void insertFoodSubs(Map<String, Integer> map);
    public void insertTripSubs(Map<String, Integer> map);
    public void insertCafeSubs(Map<String, Integer> map);
    public void deleteFoodSubs(Map<String, Integer> map);
    public void deleteTripSubs(Map<String, Integer> map);
    public void deleteCafeSubs(Map<String, Integer> map);

    public int selectTotalSubsCafe(int cafe_num);
    public int selectTotalSubsFood(int food_num);
    public int selectTotalSubsTrip(int trip_num);

    public int selectCafeSubs(Map<String, Integer> map);
    public int selectFoodSubs(Map<String, Integer> map);
    public int selectTripSubs(Map<String, Integer> map);

}
