package bit.data.service;

import bit.data.dto.FindDto;

import java.util.List;
import java.util.Map;

public interface FindServiceInter {
    public int selectTotalCount(String findcolumn, String findword);
    public List<FindDto> findPagingList(String findcolumn, String findword, int startnum, int perpage);
    public FindDto selectByNum(int find_num);
    public void insertFindBoard(FindDto dto);
    public void updateReadCount(int find_num);
    public void updateFindBoard(FindDto dto);
    public void deleteFindBoard(int find_num);
}
