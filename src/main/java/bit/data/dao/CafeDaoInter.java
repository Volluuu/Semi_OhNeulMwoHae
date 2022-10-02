package bit.data.dao;


import bit.data.dto.BoardDto;
import bit.data.dto.CafeDto;

import java.util.List;
import java.util.Map;

public interface CafeDaoInter {
    public int selectTotalCount(Map<String, String> map);
    public CafeDto getCafeData(int cafe_num);
    public List<CafeDto> selectPagingList(Map<String, Object> map);
     public void insertCafe(CafeDto dto);
    public void updateReadCount(int cafe_num);
    public void deleteCafe(int cafe_num);
    public void updateCafe(CafeDto dto);
    public void likesInsert(int cafe_num);
    public void likesUpdate(int cafe_num);
}
