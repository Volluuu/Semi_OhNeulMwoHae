package bit.data.dao;

import bit.data.dto.QnaDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDao implements QnaDaoInter {
	@Autowired
	SqlSession session;
	String ns = "bit.data.dao.QnaDao.";

	@Override
	public QnaDto getQna(int qna_num) {
		return session.selectOne(ns + "getQna");
	}
}
