package bit.data.service;

import bit.data.dto.TripDto;

import java.util.List;
import java.util.Map;

public interface TripServiceInter{
    public int selectTotalCount(String tripcolumn, String tripword);
    public TripDto getFoodData(int trip_num);
    public List<TripDto> selectPagingList(String tripcolumn, String tripword, int startnum, int perpage);
    public void insertTrip(TripDto dto);
    public void updateReadCount(int trip_num);
    public void deleteTrip(int trip_num);
    public void updateTrip(TripDto dto);
    public void likesInsert(int trip_num);
    public void likesUpdate(int trip_num);

    public TripDto selectByNum(int trip_num);
}
