package bit.data.service;

import bit.data.dao.CafeDaoInter;
import bit.data.dto.CafeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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
        int num= dto.getCafe_num();
        String title= dto.getTitle();
        String addr= dto.getAddr();
        String menu= dto.getMenu();
        String photo= dto.getPhoto();
        String tel= dto.getTel();
        String lat = dto.getLat();
        String lon = dto.getLon();
        int gu = dto.getGu();
        int readcount = dto.getReadcount();
    }

    @Override
    public void updateReadCount(int cafe_num) {
        cafedao.updateReadCount(cafe_num);
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
