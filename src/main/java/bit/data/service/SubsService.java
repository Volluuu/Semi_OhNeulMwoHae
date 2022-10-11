package bit.data.service;

import bit.data.dao.SubsDaoInter;
import bit.data.dto.CafeDto;
import bit.data.dto.FoodDto;
import bit.data.dto.SubsDto;
import bit.data.dto.TripDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SubsService implements SubsServiceInter{

    @Autowired
    SubsDaoInter subsDao;

    @Override
    public List<SubsDto> selectAllSubs(int user_num) {
        return subsDao.selectAllSubs(user_num);
    }

//    @Override
//    public List<FoodDto> selectFoodData(int food_num) {
//        return subsDao.selectFoodData(food_num);
//    }
//
//    @Override
//    public List<TripDto> selectTripData(int trip_num) {
//        return subsDao.selectTripData(trip_num);
//    }
//
//    @Override
//    public List<CafeDto> selectCafeData(int cafe_num) {
//        return subsDao.selectCafeData(cafe_num);
//    }


    @Override
    public FoodDto selectFoodData(int food_num) {
        return subsDao.selectFoodData(food_num);
    }

    @Override
    public TripDto selectTripData(int trip_num) {
        return subsDao.selectTripData(trip_num);
    }

    @Override
    public CafeDto selectCafeData(int cafe_num) {
        return subsDao.selectCafeData(cafe_num);
    }

    @Override
    public void insertFoodSubs(int user_num, int food_num) {
        Map<String, Integer> map=new HashMap<>();
        map.put("user_num",user_num);
        map.put("food_num",food_num);
        subsDao.insertFoodSubs(map);
    }

    @Override
    public void insertTripSubs(int user_num, int trip_num) {
        Map<String, Integer> map=new HashMap<>();
        map.put("user_num",user_num);
        map.put("trip_num",trip_num);
        subsDao.insertTripSubs(map);
    }

    @Override
    public void insertCafeSubs(int user_num, int cafe_num) {
        Map<String, Integer> map=new HashMap<>();
        map.put("user_num",user_num);
        map.put("cafe_num",cafe_num);
        subsDao.insertCafeSubs(map);
    }

    @Override
    public void deleteFoodSubs(int user_num, int food_num) {
        Map<String, Integer> map=new HashMap<>();
        map.put("user_num",user_num);
        map.put("food_num",food_num);
        subsDao.deleteFoodSubs(map);
    }

    @Override
    public void deleteTripSubs(int user_num, int trip_num) {
        Map<String, Integer> map=new HashMap<>();
        map.put("user_num",user_num);
        map.put("trip_num",trip_num);
        subsDao.deleteTripSubs(map);

    }

    @Override
    public void deleteCafeSubs(int user_num, int cafe_num) {
        Map<String, Integer> map=new HashMap<>();
        map.put("user_num",user_num);
        map.put("cafe_num",cafe_num);
        subsDao.deleteCafeSubs(map);

    }

    @Override
    public int selectTotalSubsCafe(int cafe_num) {
        return subsDao.selectTotalSubsCafe(cafe_num);
    }

    @Override
    public int selectTotalSubsFood(int food_num) {
        return subsDao.selectTotalSubsFood(food_num);
    }

    @Override
    public int selectTotalSubsTrip(int trip_num) {
        return subsDao.selectTotalSubsTrip(trip_num);
    }


    public int selectCafeSubs(int user_num, int cafe_num) {
        Map<String, Integer> map=new HashMap<>();
        map.put("user_num",user_num);
        map.put("cafe_num",cafe_num);
        return subsDao.selectCafeSubs(map);
    }

    @Override
    public int selectFoodSubs(int user_num, int food_num) {
        Map<String, Integer> map=new HashMap<>();
        map.put("user_num",user_num);
        map.put("food_num",food_num);
        return subsDao.selectFoodSubs(map);
    }

    @Override
    public int selectTripSubs(int user_num, int trip_num) {
        Map<String, Integer> map=new HashMap<>();
        map.put("user_num",user_num);
        map.put("trip_num",trip_num);
        return subsDao.selectTripSubs(map);
    }
}
