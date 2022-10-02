package bit.data.service;

import bit.data.dao.SubsDaoInter;
import bit.data.dto.CafeDto;
import bit.data.dto.FoodDto;
import bit.data.dto.SubsDto;
import bit.data.dto.TripDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
}
