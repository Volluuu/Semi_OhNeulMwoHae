package bit.data.service;

import bit.data.dao.QnaAnswerDaoInter;
import bit.data.dto.QnaAnswerDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaAnswerService implements QnaAnswerServiceInter {

    @Autowired
    QnaAnswerDaoInter daoInter;

    @Override
    public List<QnaAnswerDto> getAllAnswerList(int qna_num) {
        return daoInter.getAllAnswerList(qna_num);
    }

    @Override
    public void insertAnswer(QnaAnswerDto dto) {
        daoInter.insertAnswer(dto);
    }

    @Override
    public QnaAnswerDto getAnswer(int qna_num) {
        return daoInter.getAnswer(qna_num);
    }

    @Override
    public QnaAnswerDto getUserAnswer(int user_num) {
        return daoInter.getUserAnswer(user_num);
    }

    @Override
    public void deleteAnswer(int answer_num) {
        daoInter.deleteAnswer(answer_num);
    }
}
