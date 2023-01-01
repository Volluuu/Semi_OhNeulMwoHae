package bit.data.controller;

import bit.data.dto.QnaAnswerDto;
import bit.data.service.QnaAnswerServiceInter;
import bit.data.service.QnaServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class QnaAnswerController {

    @Autowired
    QnaAnswerServiceInter qnaAnswerService;

    @Autowired
    QnaServiceInter serviceInter;


    @RequestMapping("/qna/answerInsert")
    public void insert(QnaAnswerDto dto)
    {
        qnaAnswerService.insertAnswer(dto);
        serviceInter.updateAnswer();
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
