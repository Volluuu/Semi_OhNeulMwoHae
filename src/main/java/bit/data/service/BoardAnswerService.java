package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.BoardAnswerDaoInter;
import bit.data.dto.BoardAnswerDto;

@Service
public class BoardAnswerService implements BoardAnswerServiceInter {
	
	@Autowired
	BoardAnswerDaoInter daoInter;

	@Override
	public List<BoardAnswerDto> getAllAnswerList(int num) {
		// TODO Auto-generated method stub
		return daoInter.getAllAnswerList(num);
	}

	@Override
	public void insertAnswer(BoardAnswerDto dto) {
		// TODO Auto-generated method stub
		daoInter.insertAnswer(dto);
	}

	@Override
	public BoardAnswerDto getAnswer(int idx) {
		// TODO Auto-generated method stub
		return daoInter.getAnswer(idx);
	}

	@Override
	public void deleteAnswer(int idx) {
		// TODO Auto-generated method stub
		daoInter.deleteAnswer(idx);
	}

}
