package bit.data.controller;

import bit.data.service.QnaServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FaqController {

	@Autowired
	QnaServiceInter serviceInter;

	@GetMapping("/qna/faqlist")
	public String getData(Model model) {
	/*	NoticeDto dto = new QnaDto();
		dto = serviceInter.getQna(1);
		System.out.println(dto.getContent());
		model.addAttribute("subject", dto.getSubject());
		model.addAttribute("content", dto.getContent());
*/
		return "/bit/qna/faqlist";
	}
}
