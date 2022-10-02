package bit.data.dao;

import bit.data.dto.NoticeDto;
import bit.data.dto.QnaDto;

import java.util.List;
import java.util.Map;

public interface NoticeDaoInter {
	public NoticeDto getNotice(int notice_num);
	public int getMaxNum();
	public int getTotalCount(Map<String, String> map);
	public List<NoticeDto> getPagingList(Map<String, Object> map);
	public void insertNotice(NoticeDto dto);
/*	public void updateRestep(Map<String, Integer> map);
	public void updateReadCount(int num);*/
	public NoticeDto getData(int num);
	public void updateNotice(NoticeDto dto);
	public void deleteNotice(int num);
}