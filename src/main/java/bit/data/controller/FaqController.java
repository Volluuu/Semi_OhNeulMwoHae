package bit.data.controller;

import bit.data.dto.FaqDto;
import bit.data.service.FaqServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FaqController {

	@Autowired
	FaqServiceInter faqserviceInter;

	@GetMapping("/qna/faqlist")
	public String getFaqData(Model model) {
		FaqDto dto = new FaqDto();
		dto = faqserviceInter.getFaq(1);
		System.out.println(dto.getContent());
		model.addAttribute("subject", dto.getSubject());
		model.addAttribute("content", dto.getContent());

		return "/bit/qna/faqlist";
	}
}
