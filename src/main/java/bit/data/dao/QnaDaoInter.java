package bit.data.dao;

import bit.data.dto.QnaDto;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

public interface QnaDaoInter {
	public QnaDto getQna(int qna_num);
	public List<QnaDto> getAllData();
	public int getMaxNum();
	public int getTotalCount(Map<String, String> map);
	public List<QnaDto> getPagingList(Map<String, Object> map);
	public void insertQna(QnaDto dto);
	public QnaDto getUser(int user_num);
	public List<QnaDto> getUserData(int user_num);
	public void updateQna(QnaDto dto);
	public void updateAnswer();
	public void deleteQna(int qna_num);
}