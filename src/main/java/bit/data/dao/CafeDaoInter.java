package bit.data.dao;


import bit.data.dto.CafeDto;

public interface CafeDaoInter {
    public int selectTotalCount();
    public void insertCafe(CafeDto dto);
    public void updateReadCount(int cafe_num);
    public void deleteCafe(int cafe_num);
    public void updateCafe(CafeDto dto);
    public void likesInsert(int cafe_num);
    public void likesUpdate(int cafe_num);
}
