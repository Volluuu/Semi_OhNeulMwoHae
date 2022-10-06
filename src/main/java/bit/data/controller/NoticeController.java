package bit.data.controller;

import bit.data.dto.NoticeDto;
import bit.data.service.NoticeServiceInter;
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
public class NoticeController {

	@Autowired
	NoticeServiceInter notiserviceInter;

	@GetMapping("/qna/noticelist")
	public String getAllData(@RequestParam(defaultValue = "1") int currentPage,/*null일경우 기본 페이지를 1로*/
							 @RequestParam(value = "searchcolumn", required = false) String sc,/*required = false : 값이 없을 경우 null */
							 @RequestParam(value = "searchword", required = false) String sw,
							 Model model) {
		int totalCount = notiserviceInter.getTotalCount(sc, sw);
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

		List<NoticeDto> list = notiserviceInter.getPagingList(sc, sw, startNum, perPage);

		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("no", no);
		model.addAttribute("totalPage", totalPage);

		return "/bit/qna/noticelist";
	}

	@GetMapping("/qna/noticedetail")
	public ModelAndView detailNotice(int notice_num, int currentPage) {
		ModelAndView mview = new ModelAndView();

		//num에 해당하는 dto 얻기
		NoticeDto dto = notiserviceInter.getNotice(notice_num);


		mview.addObject("dto", dto);
		mview.addObject("notice_num", notice_num);
		mview.addObject("currentPage", currentPage);

		mview.setViewName("/bit/qna/noticedetail");
		return mview;
	}

	@GetMapping("/qna/noticeform")
	public String formNotice(int user_num, int currentPage, Model model) {

		model.addAttribute("user_num", user_num);
		model.addAttribute("currentPage", currentPage);

		return "/bit/qna/noticeform";
	}

	@PostMapping("/qna/noticeinsert")
	public String insertNotice(NoticeDto dto, int currentPage) {
		//db에 insert
		notiserviceInter.insertNotice(dto);

		return "redirect:noticelist?notice_num=" + dto.getNotice_num() + "currentPage=" + currentPage;
	}

	@GetMapping("/qna/noticedelete")
	public String deleteNotice(int notice_num, int currentPage) {
		notiserviceInter.deleteNotice(notice_num);
		//삭제 후 보던 페이지로 이동
		return "redirect:noticelist?currentPage"+currentPage;
	}

	@PostMapping("/qna/noticeupdate")
	public String updateNotice(NoticeDto dto, int currentPage) {
		//db에 update
		notiserviceInter.updateNotice(dto);

		return "redirect:noticedetail?currentPage=" + currentPage + "&notice_num=" + dto.getNotice_num();
	}


	@GetMapping("/qna/noticeupdateform")
	public String noticeUpdateForm(Model model, int notice_num, int currentPage) {
		System.out.println("1:" + notice_num);
		//num에 해당하는 dto 얻기
		NoticeDto dto = notiserviceInter.getNotice(notice_num);
		System.out.println("2:" + dto.getNotice_num());

		//model에 저장
		model.addAttribute("dto", dto);
		model.addAttribute("notice_num", notice_num);
		model.addAttribute("currentPage", currentPage);

		return "/bit/qna/noticeupdateform";
	}
}
