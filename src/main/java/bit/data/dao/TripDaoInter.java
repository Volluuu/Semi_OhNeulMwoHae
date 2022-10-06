package bit.data.dao;

import bit.data.dto.CafeDto;
import bit.data.dto.TripDto;

import java.util.List;
import java.util.Map;

public interface TripDaoInter {
    public int selectTotalCount(Map<String, Object> map);
    public TripDto getFoodData(int trip_num);
    public List<TripDto> selectPagingList(Map<String, Object> map);
    public void insertTrip(TripDto dto);
    public void updateReadCount(int trip_num);
    public void deleteTrip(int trip_num);
    public void updateTrip(TripDto dto);
    public void likesInsert(int trip_num);
    public void likesUpdate(int trip_num);

    public TripDto selectByNum(int trip_num);
}
