package bit.data.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import bit.data.dto.BoardDto;
import bit.data.dto.MemberDto;
import bit.data.service.BoardAnswerServiceInter;
import bit.data.service.BoardServiceInter;
import bit.data.service.MemberServiceInter;
import util.ChangeName;

@Controller
public class BoardController {
	
	@Autowired
	BoardServiceInter boardService;
	
	@Autowired
	BoardAnswerServiceInter answerService;
	
	@Autowired
	MemberServiceInter memberService;
	
	@GetMapping("/board/list")
	public String boardlist(
			@RequestParam(defaultValue = "1") int currentPage,/*null일경우 기본 페이지를 1로*/
			@RequestParam(value = "searchcolumn" ,required = false) String sc,/*required = false : 값이 없을 경우 null */
			@RequestParam(value = "searchword" ,required = false) String sw,
			Model model/*return되는 값*/
			)
	{
		//페이징 처리에 필요한 변수들
		//전체 갯수
		int totalCount=boardService.getTotalCount(sc, sw);
		int perPage=10;//한페이지당 보여질 글의 갯수
		int perBlock=5;//한블럭당 보여질 페이지의 갯수
		int startNum;//db에서 가져올 글의 시작번호(mysql은 첫글이 0번,오라클은 1번)
		int startPage;//각블럭당 보여질 시작페이지
		int endPage;//각 블럭당 보여질 끝페이지
		int totalPage;//총 페이지수
		int no;//각 페이지당 출력할 시작번호
		
		//총 페이지수를 구한다
		//총글의갯수/한페이지당보여질갯수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		
		//각 블럭당 보여질 시작페이지
		//perBlock=5 일경우 현재페이지가 1~5 일경우는 시작페이지가 1, 끝페이지가 5
		//만약 현재페이지가 13 일경우는 시작페이지가 11, 끝페이지가 15
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		//총페이지수가 23개일경우 마지막 블럭은 끝페이지가 25가 아니라 23이라야한다
		if(endPage>totalPage)
			endPage=totalPage;
		
		//각 페이지에서 보여질 시작번호
		//예: 1페이지->0, 2페이지:5, 3페이지 : 10...
		startNum=(currentPage-1)*perPage;
		
		//각페이지당 출력할 시작번호 구하기
		//예: 총글갯수가 23이라면  1페이지는 23,2페이지는 18,3페이지는 13...
		no=totalCount-(currentPage-1)*perPage;
		
		//페이지에서 보여질 글만 가져오기
		List<BoardDto> list=boardService.getPagingList(sc, sw, startNum, perPage);
		
		//list에 각 acount에 댓글 갯수 저장하기
		for(BoardDto dto:list)
		{
			int acount=answerService.getAllAnswerList(dto.getNum()).size();
			dto.setAcount(acount);
		}

		//request에 출력 시, 필요한 변수를 넣어준다
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("no",no);
		model.addAttribute("totalPage",totalPage);

		return "/bit/board/boardlist";
	}
	
	@GetMapping("/board/form")
	public String boardform(
			@RequestParam(defaultValue = "0") int num,
			@RequestParam(defaultValue = "0") int regroup,
			@RequestParam(defaultValue = "0") int restep,
			@RequestParam(defaultValue = "0") int relevel,
			@RequestParam(defaultValue = "1") int currentPage,
			Model model
			)
	{
		//답글일 경우만 넘어오는 값들이다
		//새글일 경우는 모두 null이므로 defaultValue값으로 전달
		model.addAttribute("num",num);
		model.addAttribute("regroup",regroup);
		model.addAttribute("restep",restep);
		model.addAttribute("relevel",relevel);
		model.addAttribute("currentPage",currentPage);
		
		//제목에 새글일 경우 "", 답글일 경우 해당 제목을 넣어보자
		String subject="";
		if(num>0) {
			subject=boardService.getData(num).getSubject();
		}
		model.addAttribute("subject",subject);
		
		return "/bit/board/boardform";
	}
	
	@PostMapping("/board/insert")
	public String insert(BoardDto dto,int currentPage,List<MultipartFile> upload, HttpServletRequest request)
	{
		//업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(path);
		//업로드를 안했을 경우 0번지의 파일명이 ""이된다
		//업로드 안해도 upload size가 1이 된다
		System.out.println(upload.size());
		
		if(upload.get(0).getOriginalFilename().equals("")) {
			dto.setPhoto("no");
		}else {
			String photo="";
			int idx=1;
			for(MultipartFile multi:upload) {
				String newName=idx++ +"_"+ChangeName.getChangeFileName(multi.getOriginalFilename());
				photo+=newName+",";
				
			//업로드
				
					try {
						multi.transferTo(new File(path+"/"+newName));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
			}
			//마지막 컴마 제거
			photo=photo.substring(0,photo.length()-1);
			//dto 저장
			dto.setPhoto(photo);
		}
		
		//db에 insert
		boardService.insertBoard(dto);
		
		return "redirect:list?currentPage="+currentPage;
	}
	
	@GetMapping("/board/detail")
	public ModelAndView detail(int num,int currentPage)
	{
		ModelAndView mview=new ModelAndView();
		//조회수 증가
		boardService.updateReadCount(num);
		
		//num에 해당하는 dto 얻기
		BoardDto dto=boardService.getData(num);
		
		//글쓴 사람의 사진을 memphoto
		//이때 글쓴사람이 탈퇴했을 경우 널포인터 에러 발생
		String memphoto="";
		try {
			memphoto=memberService.getDataById(dto.getId()).getProfilephoto();
		} catch (NullPointerException e) {
			// TODO: handle exception
			memphoto="no";
			dto.setName("탈퇴한 회원");
		}
		
		
		mview.addObject("dto",dto);
		mview.addObject("memphoto",memphoto);
		mview.addObject("currentPage",currentPage);
		
		mview.setViewName("/bit/board/boarddetail");
		
		return mview;
	}
	
	//좋아요수 증가
	@GetMapping("/board/likes")
	@ResponseBody
	public Map<String, Integer> likes(int num)
	{
		//좋아요 증가
		boardService.likesUpdate(num);
		//증가된 좋아요 수 불러오기 
		int likes=boardService.getData(num).getLikes();
		
		//맵에 해당 데이터 저장
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("likes", likes);
		
		return map;
	}
	
	//좋아요수 감소
		@GetMapping("/board/dislikes")
		@ResponseBody
		public Map<String, Integer> dislikes(int num)
		{
			//좋아요 증가
			boardService.likesUpdate2(num);
			//증가된 좋아요 수 불러오기 
			int likes=boardService.getData(num).getLikes();
			
			//맵에 해당 데이터 저장
			Map<String, Integer> map=new HashMap<String, Integer>();
			map.put("likes", likes);
			
			return map;
		}
	
	//삭제
	@GetMapping("/board/delete")
	public String delete(int num,int currentPage)
	{
		boardService.deleteBoard(num);
		//삭제 후 보던 페이지로 이동
		return "redirect:list?currentPage="+currentPage;
	}
	
	//수정
	@PostMapping("/board/update")
	public String update(BoardDto dto,int currentPage,List<MultipartFile> upload, HttpServletRequest request)
	{
		//업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(path);
		//업로드를 안했을 경우 0번지의 파일명이 ""이된다
		//업로드 안해도 upload size가 1이 된다
		System.out.println(upload.size());
		
		if(upload.get(0).getOriginalFilename().equals("")) {
			dto.setPhoto(null); //기존 사진들을 수정 안한다.
		}else {
			String photo="";
			int idx=1;
			for(MultipartFile multi:upload) {
				String newName=idx++ +"_"+ChangeName.getChangeFileName(multi.getOriginalFilename());
				photo+=newName+",";
				
			//업로드
				
					try {
						multi.transferTo(new File(path+"/"+newName));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
			
			}
			//마지막 컴마 제거
			photo=photo.substring(0,photo.length()-1);
			//dto 저장
			dto.setPhoto(photo);
		}
		
		//db에 insert
		boardService.updateBoard(dto);
		
		return "redirect:detail?currentPage="+currentPage+"&num="+dto.getNum();
	}
	
	@GetMapping("/board/updateform")
	public String updateform(Model model,int num, int currentPage)
	{
		//num에 해당하는 dto 얻기
		BoardDto dto=boardService.getData(num);
		
		//model에 저장
		model.addAttribute("dto",dto);
		model.addAttribute("currentPage",currentPage);
		
		return "/bit/board/updateform";
	}
}






















