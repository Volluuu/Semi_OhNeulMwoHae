package bit.data.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import bit.data.dto.MemberDto;
import bit.data.service.MemberServiceInter;
import util.ChangeName;

@Controller
@RequestMapping("/member")//앞의 공통적으로 들어가는 매핑을 설정하는 annotation
public class MemberController {
	
	@Autowired
	MemberServiceInter memService;
	
	@GetMapping("/list")
	public String mlist(Model model)
	{
		//총 멤버 인원수를 db에서 얻는다
		int totalCount=memService.getTotalCount();
		
		//전체 멤버 데이터를 가져온다
		List<MemberDto> list=memService.getAllMembers();
		
		//model에 저장
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("list",list);
		
		return "/bit/member/memberlist";
	}
	
	@GetMapping("/form")
	public String mform()
	{
		return "/bit/member/memberform";
	}
	
	@PostMapping("/insert")
	public String insert(HttpServletRequest request,MemberDto dto,MultipartFile myphoto)// MemberDto dto은 모델앤뷰 생략
	{
		// Tom cat에 올라간upload 폴더 경로
		String path=request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(path);
		//저장할 파일명 구하기
		String fileName=ChangeName.getChangeFileName(myphoto.getOriginalFilename());
		//dto에 photo에 저장
		dto.setPhoto(fileName);

		//upload try/catch
		
			try {
				myphoto.transferTo(new File(path+"/"+fileName));
				
				//db insert (성공했을때만 업로드되도록 try에 배치)
				memService.insertMember(dto);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		
		return "redirect:list"; // /member/list 맵핑주소 호출 - controller메서드 호출.redirect라 url주소도 바뀜
	}
	
	//아이디 체크하는 메서드
	@GetMapping("/idcheck")
	@ResponseBody //json 반환 annotation
	public Map<String, Integer> getSearchId(String id)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		int count=memService.getSearchId(id);//아이디가 있을 경우 1, 아니면 0을 반환하는 메서드
		
		map.put("count", count);//조회된 id에 값을 저장
		
		return map;
	}
	
	//수정
	@PostMapping("/updatephoto")
	@ResponseBody
	public void photoUpload(int num,MultipartFile photo,HttpServletRequest request,HttpSession session)
	{
		// Tom cat에 올라간upload 폴더 경로
		String path=request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(path);
		//저장할 파일명 구하기
		String fileName=ChangeName.getChangeFileName(photo.getOriginalFilename());
		
		//upload
		
			try {
				photo.transferTo(new File(path+"/"+fileName));
				
				//db에 사진 수정
				memService.updatePhoto(num, fileName);
				//세션에 사진 변경
				session.setAttribute("loginphoto", fileName);
			
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
	}
	
	//삭제
	@GetMapping("/delete")
	@ResponseBody
	public void delete(int num,HttpSession session)
	{
		memService.deleteMember(num);
		//로그인한 본인 삭제 후 모든 세션 지우기
		session.removeAttribute("loginok");
		session.removeAttribute("loginid");
		session.removeAttribute("loginname");
		session.removeAttribute("loginphoto");
		session.removeAttribute("loginhp");
		session.removeAttribute("loginemail");
	}
	
	//수정폼에 출력할 데이터 반환
	@GetMapping("/updateform")
	@ResponseBody
	public MemberDto getData(int num)
	{
		return memService.getDataByNum(num);
	}
	
	//수정
	@PostMapping("/update")
	@ResponseBody
	public void update(MemberDto dto,HttpSession session)
	{
		memService.updateMember(dto);
		
		//세션에 저장된 이름도 변경하기
		session.setAttribute("loginname", dto.getName());
		session.setAttribute("loginhp", dto.getHp());
		session.setAttribute("loginemail", dto.getEmail());
		
		
	}
	
}


























