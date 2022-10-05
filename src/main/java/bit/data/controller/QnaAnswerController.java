package bit.data.controller;

import bit.data.dto.QnaAnswerDto;
import bit.data.service.QnaAnswerServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;


import java.util.List;

@RestController
public class QnaAnswerController {

    @Autowired
    QnaAnswerServiceInter qnaAnswerService;


    @PostMapping ("/qna/answerInsert")
    public void insert(QnaAnswerDto dto)
    {
        qnaAnswerService.insertAnswer(dto);
    }

    @GetMapping("/qna/answerList")
    public List<QnaAnswerDto> list(int qna_num)
    {
        return qnaAnswerService.getAllAnswerList(qna_num);
    }

    @GetMapping("/qna/answerDelete")
    public void delete(int answer_num)
    {
        qnaAnswerService.deleteAnswer(answer_num);
    }


}
