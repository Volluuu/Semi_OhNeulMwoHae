package bit.data.dao;

import java.util.List;
import java.util.Map;

import bit.data.dto.BoardDto;

public interface BoardDaoInter {
	public int getMaxNum();
	public int getTotalCount(Map<String, String> map);
	public List<BoardDto> getPagingList(Map<String, Object> map);
	public void insertBoard(BoardDto dto);
	public void updateRestep(Map<String, Integer> map);
	public void updateReadCount(int num);
	public BoardDto getData(int num);
	public void updateBoard(BoardDto dto);
	public void deleteBoard(int num);
	public void likesUpdate(int num);
	public void likesUpdate2(int num);
}
