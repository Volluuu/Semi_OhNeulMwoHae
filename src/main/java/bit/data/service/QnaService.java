package bit.data.service;

import bit.data.dao.QnaDao;
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
	public int getTotalCount(String searchcolumn, String searchword) {
		Map<String, String> map=new HashMap<String, String>();

		map.put("searchcolumn",searchcolumn);
		map.put("searchword",searchword);

		return daoInter.getTotalCount(map);
	}

	@Override
	public List<QnaDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage) {
		Map<String, Object> map=new HashMap<String, Object>();

		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("startnum", startnum);
		map.put("perpage", perpage);

		return daoInter.getPagingList(map);
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
	public void deleteQna(int num) {
		daoInter.deleteQna(num);
	}
}
