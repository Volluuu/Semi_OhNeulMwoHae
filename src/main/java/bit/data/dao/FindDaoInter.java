package bit.data.dao;

import bit.data.dto.FindDto;

import java.util.List;
import java.util.Map;

public interface FindDaoInter {
    public int selectTotalCount(Map<String, String> map);
    public List<FindDto> findPagingList(Map<String, Object> map);
    public FindDto selectByNum(int num);
    public void insertFindBoard(FindDto dto);
    public void updateReadCount(int num);
    public void updateFindBoard(FindDto dto);
    public void deleteFindBoard(int num);

}
