package bit.data.service;

import bit.data.dao.QnaDao;
import bit.data.dao.QnaDaoInter;
import bit.data.dto.QnaDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService implements QnaServiceInter{

	@Autowired
	QnaDaoInter daoInter;

	@Override
	public QnaDto getQna(int qna_num) {
		return daoInter.getQna(qna_num);
	}
}
