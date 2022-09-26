package bit.data.controller;


import java.util.HashMap;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import bit.data.dto.MemberDto;
import bit.data.service.MemberServiceInter;


@Controller
@RequestMapping("/member")
public class LoginController {
	
	@Autowired
	MemberServiceInter memService;

	@GetMapping("/login")
	@ResponseBody
	public Map<String , String> loginprocess(String id, String pass,HttpSession session)
	{
		System.out.println(id);
		Map<String, String> map=new HashMap<String, String>();
		int result=memService.getIdPassCheck(id, pass);
		if(result==1)//아이디,패스 맞는 경우
		{
			//유지 시간 설정
			//session.setMaxInactiveInterval(result);
			session.setMaxInactiveInterval(60*60*4);//4시간 유지
			//로그인한 아이디에 대한 정보를 얻어서 세션에 저장
			MemberDto mdto=memService.getDataById(id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", id);
			session.setAttribute("loginname", mdto.getName());
			session.setAttribute("loginphoto", mdto.getPhoto());
			session.setAttribute("loginhp", mdto.getHp());
			session.setAttribute("loginemail", mdto.getEmail());
			
		}
		map.put("result", result==1?"success":"fail");
		return map;
	}
	
	@GetMapping("/logout")
	@ResponseBody
	public void logout(HttpSession session)
	{
		//로그아웃 시 제거되어야할 세션
		session.removeAttribute("loginok");
		session.removeAttribute("loginid");
	}
	
	

}





































