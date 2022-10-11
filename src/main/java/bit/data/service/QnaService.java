package bit.data.service;

import bit.data.dao.QnaDaoInter;
import bit.data.dto.QnaDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class QnaService implements QnaServiceInter{

	@Autowired
	QnaDaoInter daoInter;

	@Override
	public QnaDto getQna(int qna_num) {
		return daoInter.getQna(qna_num);
	}

	@Override
	public List<QnaDto> getAllData() {
		return daoInter.getAllData();
	}

	@Override
	public int getMaxNum() {
		return daoInter.getMaxNum();
	}

	@Override
	public int getTotalCount(String searchcolumn, String searchword,int user_num) {
		Map<String, Object> map=new HashMap<String, Object>();

		map.put("user_num",user_num);
		map.put("qnasearchcolumn",searchcolumn);
		map.put("qnasearchword",searchword);

		return daoInter.getTotalCount(map);
	}

	@Override
	public List<QnaDto> getPagingList(String searchcolumn, String searchword,int user_num, int startnum, int perpage) {
		Map<String, Object> map=new HashMap<String, Object>();

		map.put("qnasearchcolumn", searchcolumn);
		map.put("qnasearchword", searchword);
		map.put("user_num", user_num);
		map.put("startnum", startnum);
		map.put("perpage", perpage);

		return daoInter.getPagingList(map);
	}

	@Override
	public int getAnswerCount(String searchcolumn, String searchword, int user_num) {
		Map<String, Object> map=new HashMap<String, Object>();

		map.put("user_num",user_num);
		map.put("qnasearchcolumn",searchcolumn);
		map.put("qnasearchword",searchword);

		return daoInter.getAnswerCount(map);
	}

	@Override
	public List<QnaDto> getAnswerList(String searchcolumn, String searchword, int user_num, int startnum, int perpage) {
		Map<String, Object> map=new HashMap<String, Object>();

		map.put("qnasearchcolumn", searchcolumn);
		map.put("qnasearchword", searchword);
		map.put("user_num", user_num);
		map.put("startnum", startnum);
		map.put("perpage", perpage);

		return daoInter.getAnswerList(map);
	}

	@Override
	public void insertQna(QnaDto dto) {

		int qna_num=dto.getQna_num();

		daoInter.insertQna(dto);
	}

	@Override
	public QnaDto getUser(int user_num) {
		return daoInter.getUser(user_num);
	}

	@Override
	public void updateQna(QnaDto dto) {
		daoInter.updateQna(dto);
	}

	@Override
	public void updateAnswer() {
		daoInter.updateAnswer();
	}

	@Override
	public List<QnaDto> getUserData(int user_num) {
		return daoInter.getUserData(user_num);
	}

	@Override
	public void deleteQna(int qna_num) {
		daoInter.deleteQna(qna_num);
	}
}
