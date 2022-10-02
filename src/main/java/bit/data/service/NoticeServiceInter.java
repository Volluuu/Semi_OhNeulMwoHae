package bit.data.service;

import bit.data.dto.NoticeDto;

import java.util.List;

public interface NoticeServiceInter {
	public NoticeDto getNotice(int notice_num);
	public int getMaxNum();
	public int getTotalCount(String searchcolumn, String searchword);
	public List<NoticeDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage);
	public void insertNotice(NoticeDto dto);
	/*public void updateRestep(int regroup,int restep);*/
	/*public void updateReadCount(int num);*/
	public NoticeDto getData(int num);
	public void updateNotice(NoticeDto dto);
	public void deleteNotice(int num);

}
