package bit.data.service;

import bit.data.dto.CafeDto;
import bit.data.dto.FoodDto;
import bit.data.dto.SubsDto;
import bit.data.dto.TripDto;

import java.util.List;

public interface SubsServiceInter {

    public List<SubsDto> selectAllSubs(int user_num);

//    public List<FoodDto> selectFoodData(int food_num);
//    public List<TripDto> selectTripData(int trip_num);
//    public List<CafeDto> selectCafeData(int cafe_num);

    public FoodDto selectFoodData(int food_num);
    public TripDto selectTripData(int trip_num);
    public CafeDto selectCafeData(int cafe_num);
}
