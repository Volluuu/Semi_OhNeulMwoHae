package bit.data.service;

import bit.data.dao.FindDaoInter;
import bit.data.dto.FindDto;
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
    public List<FindDto> findPagingList(String findcolumn, String findword, int startnum, int perpage) {
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("findcolumn", findcolumn);
        map.put("findword", findword);
        map.put("startnum", startnum);
        map.put("perpage", perpage);
        return findDao.findPagingList(map);
    }

    @Override
    public FindDto selectByNum(int num) {
        return findDao.selectByNum(num);
    }

    @Override
    public void insertFindBoard(FindDto dto) {
        findDao.insertFindBoard(dto);
    }

    @Override
    public void updateReadCount(int num) {
        findDao.updateReadCount(num);
    }

    @Override
    public void updateFindBoard(FindDto dto) {
        findDao.updateFindBoard(dto);
    }

    @Override
    public void deleteFindBoard(int num) {
        findDao.deleteFindBoard(num);
    }
}
