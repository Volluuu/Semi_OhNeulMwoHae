package bit.data.dao;

import bit.data.dto.*;

import java.util.List;
import java.util.Map;

public interface FindDaoInter {
    public int selectTotalCount(Map<String, String> map);
    public List<FindDto> findPagingList(Map<String, Object> map);

    public UserDto selectUserByfindNum(int find_num);
    public FindDto selectByNum(int find_num);
    public void insertFindBoard(FindDto dto);
    public void updateReadCount(int find_num);
    public void updateFindBoard(FindDto dto);
    public void deleteFindBoard(int find_num);

    public List<CafeDto> selectCafeData(String cword);
    public List<TripDto> selectTripData(String cword);
    public List<FoodDto> selectFoodData(String cword);

}
