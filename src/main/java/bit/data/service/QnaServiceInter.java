package bit.data.service;

import bit.data.dto.QnaDto;

import java.util.List;

public interface QnaServiceInter {
	public QnaDto getQna(int qna_num);
	public List<QnaDto> getAllData();
	public int getMaxNum();
	public int getTotalCount(String searchcolumn,String searchword,int user_num);
	public List<QnaDto> getPagingList(String searchcolumn,String searchword,int user_num,int startnum,int perpage);
	public void insertQna(QnaDto dto);
	public QnaDto getUser(int user_num);
	public List<QnaDto> getUserData(int user_num);
	public void updateQna(QnaDto dto);
	public void updateAnswer();
	public void deleteQna(int qna_num);

}
