package bit.data.dao;


import bit.data.dto.CafeDto;

import java.util.Map;

public interface CafeDaoInter {
    public int selectTotalCount(Map<String, String> map);
    public void insertCafe(CafeDto dto);
    public void updateReadCount(int cafe_num);
    public void deleteCafe(int cafe_num);
    public void updateCafe(CafeDto dto);
    public void likesInsert(int cafe_num);
    public void likesUpdate(int cafe_num);
}
