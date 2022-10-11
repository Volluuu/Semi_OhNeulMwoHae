package bit.data.controller;

import bit.data.dto.QnaDto;
import bit.data.service.QnaAnswerServiceInter;
import bit.data.service.QnaServiceInter;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class QnaController {

	@Autowired
	QnaServiceInter serviceInter;

	@Autowired
	UserServiceInter userServiceInter;

	@Autowired
	QnaAnswerServiceInter qnaAnswerServiceInter;


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
	public String getAllData(@RequestParam(defaultValue = "1") int currentPage,/*null일경우 기본 페이지를 1로*/
							 @RequestParam(value = "user_num" ,required = false) String user_num,
							 @RequestParam(value = "qnasearchcolumn" ,required = false) String sc,/*required = false : 값이 없을 경우 null */
							 @RequestParam(value = "qnasearchword" ,required = false) String sw,
								   Model model) {

		if(user_num==null){
			user_num="0";
		}

		int totalCount = serviceInter.getTotalCount(sc, sw,Integer.parseInt(user_num));
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
/*
		if (user_num == 1) {
			//List<QnaDto> list=serviceInter.getAllData();
			List<QnaDto> list = serviceInter.getPagingList(sc, sw, startNum, perPage);


			for (QnaDto dto : list) {
				int acount = qnaAnswerServiceInter.getAllAnswerList(dto.getQna_num()).size();
				dto.setAcount(acount);
			}

			model.addAttribute("list", list);
		}else {
			List<QnaDto> list = serviceInter.getUserData(user_num);

			for (QnaDto dto : list) {
				int acount = qnaAnswerServiceInter.getAllAnswerList(dto.getQna_num()).size();
				dto.setAcount(acount);
			}

			model.addAttribute("list", list);
		}*/
		List<QnaDto> list = serviceInter.getPagingList(sc, sw,Integer.parseInt(user_num), startNum, perPage);


		for (QnaDto dto : list) {
			int acount = qnaAnswerServiceInter.getAllAnswerList(dto.getQna_num()).size();
			dto.setAcount(acount);
		}

		model.addAttribute("totalCount",totalCount);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("no",no);
		model.addAttribute("totalPage",totalPage);

		return "/bit/qna/qnalist";

	}


	@GetMapping("/qna/qnaAllList")
	@ResponseBody
	public Map<String, Object> getAllList(@RequestParam(defaultValue = "1") int currentPage,/*null일경우 기본 페이지를 1로*/
										  @RequestParam(value = "user_num",required = false) String user_num,
										  @RequestParam(value = "qnasearchcolumn" ,required = false) String sc,/*required = false : 값이 없을 경우 null */
										  @RequestParam(value = "qnasearchword" ,required = false) String sw){
		//	public String getAllData(@RequestParam(defaultValue = "1") int currentPage,/*null일경우 기본 페이지를 1로*/
//							/* @RequestParam(value = "user_num") int user_num,*/
//							 @RequestParam(value = "searchcolumn" ,required = false) String sc,/*required = false : 값이 없을 경우 null */
//							 @RequestParam(value = "searchword" ,required = false) String sw,
//								   Model model) {
		if(user_num==null){
			user_num="0";
		}

		int totalCount = serviceInter.getTotalCount(sc, sw,Integer.parseInt(user_num));
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
/*
		if (user_num == 1) {
			//List<QnaDto> list=serviceInter.getAllData();
			List<QnaDto> list = serviceInter.getPagingList(sc, sw, startNum, perPage);


			for (QnaDto dto : list) {
				int acount = qnaAnswerServiceInter.getAllAnswerList(dto.getQna_num()).size();
				dto.setAcount(acount);
			}

			model.addAttribute("list", list);
		}else {
			List<QnaDto> list = serviceInter.getUserData(user_num);

			for (QnaDto dto : list) {
				int acount = qnaAnswerServiceInter.getAllAnswerList(dto.getQna_num()).size();
				dto.setAcount(acount);
			}

			model.addAttribute("list", list);
		}*/
		List<QnaDto> list = serviceInter.getPagingList(sc, sw, Integer.parseInt(user_num),startNum, perPage);


		for (QnaDto dto : list) {
			int acount = qnaAnswerServiceInter.getAllAnswerList(dto.getQna_num()).size();
			dto.setAcount(acount);
		}

//		model.addAttribute("totalCount",totalCount);
//		model.addAttribute("currentPage",currentPage);
//		model.addAttribute("startPage",startPage);
//		model.addAttribute("endPage",endPage);
//		model.addAttribute("no",no);
//		model.addAttribute("totalPage",totalPage);
//
//		return "/bit/qna/qnalist";

		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list",list);
	/*	map.put("user_num",user_num);*/
		map.put("currentPage",currentPage);
		map.put("startPage",startPage);
		map.put("endPage",endPage);
		map.put("no",no);
		map.put("totalPage",totalPage);

		return map;
	}

	@GetMapping("/qna/qnaSearchList")
	@ResponseBody
	public Map<String, Object> getSearchList(@RequestParam(defaultValue = "1") int currentPage,/*null일경우 기본 페이지를 1로*/
											 @RequestParam(value = "user_num",required = false) String user_num,
											 @RequestParam(value = "qnasearchcolumn" ,required = false) String sc,/*required = false : 값이 없을 경우 null */
											 @RequestParam(value = "qnasearchword" ,required = false) String sw){
		//	public String getAllData(@RequestParam(defaultValue = "1") int currentPage,/*null일경우 기본 페이지를 1로*/
//							/* @RequestParam(value = "user_num") int user_num,*/
//							 @RequestParam(value = "searchcolumn" ,required = false) String sc,/*required = false : 값이 없을 경우 null */
//							 @RequestParam(value = "searchword" ,required = false) String sw,
//								   Model model) {
		if(user_num==null){
			user_num="0";
		}

		int totalCount = serviceInter.getTotalCount(sc, sw,Integer.parseInt(user_num));
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
/*
		if (user_num == 1) {
			//List<QnaDto> list=serviceInter.getAllData();
			List<QnaDto> list = serviceInter.getPagingList(sc, sw, startNum, perPage);


			for (QnaDto dto : list) {
				int acount = qnaAnswerServiceInter.getAllAnswerList(dto.getQna_num()).size();
				dto.setAcount(acount);
			}

			model.addAttribute("list", list);
		}else {
			List<QnaDto> list = serviceInter.getUserData(user_num);

			for (QnaDto dto : list) {
				int acount = qnaAnswerServiceInter.getAllAnswerList(dto.getQna_num()).size();
				dto.setAcount(acount);
			}

			model.addAttribute("list", list);
		}*/
		List<QnaDto> list = serviceInter.getPagingList(sc, sw, Integer.parseInt(user_num),startNum, perPage);


		for (QnaDto dto : list) {
			int acount = qnaAnswerServiceInter.getAllAnswerList(dto.getQna_num()).size();
			dto.setAcount(acount);
		}

//		model.addAttribute("totalCount",totalCount);
//		model.addAttribute("currentPage",currentPage);
//		model.addAttribute("startPage",startPage);
//		model.addAttribute("endPage",endPage);
//		model.addAttribute("no",no);
//		model.addAttribute("totalPage",totalPage);
//
//		return "/bit/qna/qnalist";

		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list",list);
		/*map.put("user_num",user_num);*/
		map.put("currentPage",currentPage);
		map.put("startPage",startPage);
		map.put("endPage",endPage);
		map.put("no",no);
		map.put("totalPage",totalPage);


		return map;
	}


	@GetMapping("/qna/qnadetail")
	public ModelAndView detailQna(int qna_num, int currentPage) {
		ModelAndView mview=new ModelAndView();

		//num에 해당하는 dto 얻기
		QnaDto dto=serviceInter.getQna(qna_num);


		mview.addObject("dto",dto);
		mview.addObject("qna_num",qna_num);
		mview.addObject("currentPage",currentPage);

		mview.setViewName("/bit/qna/qnadetail");
		return mview;
	}



	@GetMapping("/qna/qnaform")
	public String qnainsert(int user_num,int currentPage,Model model){

		model.addAttribute("user_num",user_num);
		model.addAttribute("currentPage",currentPage);

		return "/bit/qna/qnaform";
	}

	@PostMapping("/qna/qnainsert")
	public String insertQna(QnaDto dto, int currentPage)
	{
		//db에 insert
		serviceInter.insertQna(dto);

		return "redirect:qnalist?qna_num="+dto.getQna_num()+"currentPage="+currentPage;
	}

	@GetMapping("/qna/qnadelete")
	@ResponseBody
	public String deleteQna(int qna_num,int currentPage)
	{
		serviceInter.deleteQna(qna_num);
		//삭제 후 보던 페이지로 이동
		return "redirect:qnalist?currentPage="+currentPage;
	}

	@PostMapping("/qna/qnaupdate")
	public String updateQna(QnaDto dto,int currentPage)
	{
		//db에 update
		serviceInter.updateQna(dto);
		serviceInter.updateAnswer();

		return "redirect:qnadetail?currentPage="+currentPage+"&qna_num="+dto.getQna_num();
	}


	@GetMapping("/qna/qnaupdateform")
	public String qnaUpdateForm(Model model,int qna_num,int currentPage)
	{
		System.out.println("1:"+qna_num);
		//num에 해당하는 dto 얻기
		QnaDto dto=serviceInter.getQna(qna_num);
		System.out.println("2:"+dto.getQna_num());

		//model에 저장
		model.addAttribute("dto",dto);
		model.addAttribute("qna_num",qna_num);
		model.addAttribute("currentPage",currentPage);

		return "/bit/qna/qnaupdateform";
	}
}
