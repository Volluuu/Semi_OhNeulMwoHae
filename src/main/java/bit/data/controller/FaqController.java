package bit.data.controller;

import bit.data.dto.FaqDto;
import bit.data.dto.NoticeDto;
import bit.data.service.FaqServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class FaqController {

	@Autowired
	FaqServiceInter faqserviceInter;

	@GetMapping("/qna/faqlist")
	public String getAllData(@RequestParam(defaultValue = "1") int currentPage,/*null일경우 기본 페이지를 1로*/
							 @RequestParam(value = "searchcolumn", required = false) String sc,/*required = false : 값이 없을 경우 null */
							 @RequestParam(value = "searchword", required = false) String sw,
							 Model model) {
		int totalCount = faqserviceInter.getTotalCount(sc, sw);
		int perPage = 10;//한페이지당 보여질 글의 갯수
		int perBlock = 5;//한블럭당 보여질 페이지의 갯수
		int startNum;//db에서 가져올 글의 시작번호(mysql은 첫글이 0번,오라클은 1번)
		int startPage;//각블럭당 보여질 시작페이지
		int endPage;//각 블럭당 보여질 끝페이지
		int totalPage;//총 페이지수
		int no;//각 페이지당 출력할 시작번호

		totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;

		if (endPage > totalPage)
			endPage = totalPage;

		startNum = (currentPage - 1) * perPage;

		no = totalCount - (currentPage - 1) * perPage;

		List<FaqDto> list = faqserviceInter.getPagingList(sc, sw, startNum, perPage);

		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("no", no);
		model.addAttribute("totalPage", totalPage);

		return "/bit/qna/faqlist";
	}

	@GetMapping("/qna/faqdetail")
	public ModelAndView detailFaq(int faq_num, int currentPage) {
		ModelAndView mview = new ModelAndView();

		//num에 해당하는 dto 얻기
		FaqDto dto = faqserviceInter.getFaq(faq_num);


		mview.addObject("dto", dto);
		mview.addObject("faq_num", faq_num);
		mview.addObject("currentPage", currentPage);

		mview.setViewName("/bit/qna/faqdetail");
		return mview;
	}

	@GetMapping("/qna/faqform")
	public String formFaq(int user_num, int currentPage, Model model) {

		model.addAttribute("user_num", user_num);
		model.addAttribute("currentPage", currentPage);

		return "/bit/qna/faqform";
	}

	@PostMapping("/qna/faqinsert")
	public String insertFaq(FaqDto dto, int currentPage) {
		//db에 insert
		faqserviceInter.insertFaq(dto);

		return "redirect:faqlist?faq_num=" + dto.getFaq_num() + "currentPage=" + currentPage;
	}

	@GetMapping("/qna/faqdelete")
	public String deleteFaq(int faq_num, int currentPage) {
		faqserviceInter.deleteFaq(faq_num);
		//삭제 후 보던 페이지로 이동
		return "redirect:faqlist?currentPage"+currentPage;
	}

	@PostMapping("/qna/faqupdate")
	public String updateFaq(FaqDto dto, int currentPage) {
		//db에 update
		faqserviceInter.updateFaq(dto);

		return "redirect:faqdetail?currentPage=" + currentPage + "&faq_num=" + dto.getFaq_num();
	}


	@GetMapping("/qna/faqupdateform")
	public String faqUpdateForm(Model model, int faq_num, int currentPage) {
		System.out.println("1:" + faq_num);
		//num에 해당하는 dto 얻기
		FaqDto dto = faqserviceInter.getFaq(faq_num);
		System.out.println("2:" + dto.getFaq_num());

		//model에 저장
		model.addAttribute("dto", dto);
		model.addAttribute("faq_num", faq_num);
		model.addAttribute("currentPage", currentPage);

		return "/bit/qna/faqupdateform";
	}
}
