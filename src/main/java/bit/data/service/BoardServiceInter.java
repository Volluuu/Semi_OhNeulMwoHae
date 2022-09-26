package bit.data.service;

import java.util.List;

import bit.data.dto.BoardDto;

public interface BoardServiceInter {

	public int getMaxNum();
	public int getTotalCount(String searchcolumn,String searchword);
	public List<BoardDto> getPagingList(String searchcolumn,String searchword,int startnum,int perpage);
	public void insertBoard(BoardDto dto);
	public void updateRestep(int regroup,int restep);
	public void updateReadCount(int num);
	public BoardDto getData(int num);
	public void updateBoard(BoardDto dto);
	public void deleteBoard(int num);
	public void likesUpdate(int num);
	public void likesUpdate2(int num);
}
