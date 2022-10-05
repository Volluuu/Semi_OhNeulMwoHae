package bit.data.dao;

import bit.data.dto.QnaAnswerDto;

import java.util.List;

public interface QnaAnswerDaoInter {

    public List<QnaAnswerDto> getAllAnswerList(int answer_num);
    public void inserAnswer(QnaAnswerDto dto);
    public QnaAnswerDto getAnswer(int qna_num);
    public QnaAnswerDto getUserAnswer(int user_num);
    public void deleteAnswer(int qna_num);
}
