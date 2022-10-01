package bit.data.dao;

import bit.data.dto.QnaDto;
import org.springframework.stereotype.Repository;

public interface QnaDaoInter {
	public QnaDto getQna(int qna_num);
}