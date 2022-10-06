package bit.data.service;

import bit.data.dto.CafeDto;
import bit.data.dto.FindDto;

import java.util.List;
import java.util.Map;

public interface CafeServiceInter {
    public int selectTotalCount(String cafecolumn, String cafeword, int gu);
    public List<CafeDto> selectPagingList(String cafecolumn, String cafeword, int startnum, int perpage, int gu);
    public void insertCafe(CafeDto dto);
    public CafeDto getData(int cafe_num);
    public void updateReadCount(int cafe_num);
    public void deleteCafe(int cafe_num);
    public void updateCafe(CafeDto dto);
    public void likesInsert(int cafe_num);
    public void likesUpdate(int cafe_num);

    public CafeDto selectByNum(int cafe_num);
}
