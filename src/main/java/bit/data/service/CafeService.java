package bit.data.service;

import bit.data.dao.CafeDaoInter;
import bit.data.dao.FoodDao;
import bit.data.dto.CafeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CafeService implements CafeServiceInter {

    @Autowired
    CafeDaoInter cafedao;
    public int selectTotalCount(String cafecolumn, String cafeword) {
        Map<String,String> map=new HashMap<String, String>();
        map.put("cafecolumn", cafecolumn);
        map.put("cafeword", cafeword);
        return cafedao.selectTotalCount(map);
    }

    @Override
    public void insertCafe(CafeDto dto) {
        cafedao.insertCafe(dto);
    }

    @Override
    public void updateReadCount(int cafe_num) {
        cafedao.updateReadCount(cafe_num);
    }

    @Override
    public List<CafeDto> selectPagingList(String cafecolumn, String cafeword, int startnum, int perpage) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("cafecolumn", cafecolumn);
        map.put("cafesword", cafeword);
        map.put("startnum", startnum);
        map.put("perpage", perpage);
        return cafedao.selectPagingList(map);
    }

    @Override
    public void deleteCafe(int cafe_num) {
        cafedao.deleteCafe(cafe_num);
    }

    @Override
    public void updateCafe(CafeDto dto) {
        cafedao.updateCafe(dto);
    }

    @Override
    public void likesInsert(int cafe_num) {
        cafedao.likesUpdate(cafe_num);
    }

    @Override
    public void likesUpdate(int cafe_num) {
        cafedao.likesUpdate(cafe_num);
    }
}
