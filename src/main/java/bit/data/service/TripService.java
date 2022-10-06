package bit.data.service;

import bit.data.dao.TripDaoInter;
import bit.data.dto.TripDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TripService implements TripServiceInter{

    @Autowired
    TripDaoInter tripdao;

    @Override
    public int selectTotalCount(String tripcolumn, String tripword, int gu) {
        Map<String, Object> map=new HashMap<>();
        map.put("tripcolumn",tripcolumn);
        map.put("tripword",tripword);
        map.put("gu",gu);
        return tripdao.selectTotalCount(map);
    }

    @Override
    public TripDto getFoodData(int trip_num) {
        return tripdao.getFoodData(trip_num);
    }

    @Override
    public List<TripDto> selectPagingList(String tripcolumn, String tripword, int startnum, int perpage, int gu) {
        Map<String, Object> map = new HashMap<>();
        map.put("tripcolumn",tripcolumn);
        map.put("tripword",tripword);
        map.put("startnum",startnum);
        map.put("perpage",perpage);
        map.put("gu",gu);
        return tripdao.selectPagingList(map);
    }

    @Override
    public void insertTrip(TripDto dto) {
        tripdao.insertTrip(dto);
    }

    @Override
    public void updateReadCount(int trip_num) {
        tripdao.updateReadCount(trip_num);
    }

    @Override
    public void deleteTrip(int trip_num) {
        tripdao.deleteTrip(trip_num);
    }

    @Override
    public void updateTrip(TripDto dto) {
        tripdao.updateTrip(dto);
    }

    @Override
    public void likesInsert(int trip_num) {
        tripdao.likesInsert(trip_num);
    }

    @Override
    public void likesUpdate(int trip_num) {
        tripdao.likesInsert(trip_num);
    }

    @Override
    public TripDto selectByNum(int trip_num) {
        return tripdao.selectByNum(trip_num);
    }
}
