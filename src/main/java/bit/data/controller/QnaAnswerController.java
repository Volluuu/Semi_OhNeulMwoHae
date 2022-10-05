//package bit.data.controller;
//
//import bit.data.dto.QnaAnswerDto;
//import bit.data.service.QnaAnswerServiceInter;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//
//import java.util.List;
//
//@Controller
//public class QnaAnswerController {
//
//    @Autowired
//    QnaAnswerServiceInter answerService;
//
//
//    @PostMapping ("/answer/insert")
//    public void insert(QnaAnswerDto dto)
//    {
//        answerService.inserAnswer(dto);
//    }
//
//    @GetMapping("/answer/list")
//    public List<QnaAnswerDto> list(int answer_num)
//    {
//        return answerService.getAllAnswerList(answer_num);
//    }
//
//    @GetMapping("/answer/delete")
//    public void delete(int qna_num)
//    {
//        answerService.deleteAnswer(qna_num);
//    }
//
//
//}
