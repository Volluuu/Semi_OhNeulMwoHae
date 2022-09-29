package bit.data.service;

import bit.data.dto.CafeDto;

import java.util.List;
import java.util.Map;

public interface CafeServiceInter {
    public int selectTotalCount(String cafecolumn, String cafeword);
    public List<CafeDto>  selectPagingList(String cafecolumn, String cafeword, int startnum, int perpage);
    public void insertCafe(CafeDto dto);
    public void updateReadCount(int cafe_num);
    public void deleteCafe(int cafe_num);
    public void updateCafe(CafeDto dto);
    public void likesInsert(int cafe_num);
    public void likesUpdate(int cafe_num);
}
