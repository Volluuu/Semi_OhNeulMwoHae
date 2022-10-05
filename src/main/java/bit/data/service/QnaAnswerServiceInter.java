package bit.data.service;

import bit.data.dto.QnaAnswerDto;

import java.util.List;

public interface QnaAnswerServiceInter {
    public List<QnaAnswerDto> getAllAnswerList(int qna_num);
    public void insertAnswer(QnaAnswerDto dto);
    public QnaAnswerDto getAnswer(int qna_num);
    public QnaAnswerDto getUserAnswer(int user_num);
    public void deleteAnswer(int answer_num);
}
