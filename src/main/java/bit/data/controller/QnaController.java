package bit.data.controller;

import bit.data.dto.QnaDto;
import bit.data.service.QnaServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class QnaController {

	@Autowired
	QnaServiceInter serviceInter;

	/*@GetMapping("/qna/qnalist")
	public String getQnaData(Model model) {
		QnaDto dto = new QnaDto();
		dto = serviceInter.getQna(1);
		System.out.println(dto.getContent());
		model.addAttribute("subject", dto.getSubject());
		model.addAttribute("content", dto.getContent());

		return "/bit/qna/qnalist";
	}*/

	@GetMapping("/qna/qnalist")
	public String getAllData(Model model){
		List<QnaDto> list=serviceInter.getAllData();

		model.addAttribute("list",list);

		return "/bit/qna/qnalist";
	}
	@GetMapping("/qna/qnaform")
	public String qnainsert(){
		return "/bit/qna/qnaform";
	}
}
