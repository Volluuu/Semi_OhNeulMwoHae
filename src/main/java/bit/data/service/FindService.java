package bit.data.service;

import bit.data.dao.FindDaoInter;
import bit.data.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FindService implements FindServiceInter{

    @Autowired
    FindDaoInter findDao;

    @Override
    public int selectTotalCount(String findcolumn, String findword) {
        Map<String, String> map=new HashMap<String, String>();
        map.put("findcolumn", findcolumn);
        map.put("findword", findword);
        return findDao.selectTotalCount(map);
    }

    @Override
    public List<FindDto> findPagingList(String findcolumn, String findword, int startNum, int perPage) {
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("findcolumn", findcolumn);
        map.put("findword", findword);
        map.put("startNum", startNum);
        map.put("perPage", perPage);
        return findDao.findPagingList(map);
    }

    @Override
    public UserDto selectUserByfindNum(int find_num) {
        return findDao.selectUserByfindNum(find_num);
    }

    @Override
    public FindDto selectByNum(int find_num) {
        return findDao.selectByNum(find_num);
    }

    @Override
    public void insertFindBoard(FindDto dto) {
        findDao.insertFindBoard(dto);
    }

    @Override
    public void updateReadCount(int find_num) {
        findDao.updateReadCount(find_num);
    }

    @Override
    public void updateFindBoard(FindDto dto) {
        findDao.updateFindBoard(dto);
    }

    @Override
    public void deleteFindBoard(int find_num) {
        findDao.deleteFindBoard(find_num);
    }

    @Override
    public List<CafeDto> selectCafeData(String cword) {
        return findDao.selectCafeData(cword);
    }

    @Override
    public List<TripDto> selectTripData(String cword) {
        return findDao.selectTripData(cword);
    }

    @Override
    public List<FoodDto> selectFoodData(String cword) {
        return findDao.selectFoodData(cword);
    }

    @Override
    public List<CourseDto> selectMyCourse(int user_num) {
        return findDao.selectMyCourse(user_num);
    }
}
