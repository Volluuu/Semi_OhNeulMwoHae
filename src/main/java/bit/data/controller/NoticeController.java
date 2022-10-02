package bit.data.controller;

import bit.data.dto.NoticeDto;
import bit.data.dto.QnaDto;
import bit.data.service.NoticeServiceInter;
import bit.data.service.QnaServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {

	@Autowired
	NoticeServiceInter serviceInter;

	@GetMapping("/qna/noticelist")
	public String getData(Model model) {
		NoticeDto dto = new NoticeDto();
		dto = serviceInter.getNotice(1);
		System.out.println(dto.getContent());
		model.addAttribute("subject", dto.getSubject());
		model.addAttribute("content", dto.getContent());
		return "/bit/qna/noticelist";
	}
}
