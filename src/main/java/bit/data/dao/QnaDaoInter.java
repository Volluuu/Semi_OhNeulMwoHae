package bit.data.dao;

import bit.data.dto.QnaDto;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

public interface QnaDaoInter {
	public QnaDto getQna(int qna_num);
	public int getMaxNum();
	public int getTotalCount(Map<String, String> map);
	public List<QnaDto> getPagingList(Map<String, Object> map);
	public void insertQna(QnaDto dto);
/*	public void updateRestep(Map<String, Integer> map);
	public void updateReadCount(int num);*/
	public QnaDto getData(int num);
	public void updateQna(QnaDto dto);
	public void deleteQna(int num);
}