package bit.data.controller;


import java.util.HashMap;
import java.util.Map;


import javax.servlet.http.HttpSession;

import bit.data.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;


@Controller
@RequestMapping("/user")
public class LoginController {
	
	@Autowired
	UserServiceInter userService;

	@GetMapping("/kakao")
	public String kakaoprocess(@RequestParam String code, HttpSession session) {
		System.out.println(code);
		String access_token = userService.getKakaoAccessToken(code);
		UserDto udto = userService.getUserInfo(access_token);

		// 기존에 카카오 ID로 로그인한 적이 있는지 확인
		UserDto udto_old = userService.getUserByKakaoId(udto.getKakao_id());
		// 로그인 정보가 있으면 (=kakao_id 컬럼에서 같은 값이 있는 게 확인되면) 그걸 불러온다
		if (udto_old != null) {
			udto = udto_old;
		} else {  // 아니라면 새로운 유저를 생성한다
			userService.insertUser(udto);
		}

		//유지 시간 설정
		//session.setMaxInactiveInterval(result);
		session.setMaxInactiveInterval(60*60*4);//4시간 유지
		//로그인한 아이디에 대한 정보를 얻어서 세션에 저장
		session.setAttribute("loginok", "yes");
		session.setAttribute("user_num", udto.getUser_num());
		session.setAttribute("kakao_id", udto.getKakao_id());
		session.setAttribute("naver_id", udto.getNaver_id());
		session.setAttribute("loginid", udto.getLoginid());
		session.setAttribute("password", udto.getPassword());
		session.setAttribute("loginname", udto.getName());
		session.setAttribute("nickname", udto.getNickname());
		session.setAttribute("email", udto.getEmail());
		session.setAttribute("profile", udto.getProfile());
		session.setAttribute("loginphoto", udto.getProfilephoto());
		session.setAttribute("loginhp", udto.getHp());
		session.setAttribute("isadmin",udto.getIsadmin());
		session.setAttribute("alarm", udto.getAlarm());
		session.setAttribute("interest", udto.getInterest());
		// userDto = userService.getAgreementInfo(access_token);
		return "redirect:/";
	}

	@GetMapping("/naver")
	public String naverprocess(@RequestParam String code, @RequestParam String state, HttpSession session) {
		System.out.println(code);
		String access_token = userService.getNaverAccessToken(code, state);
		UserDto udto = userService.getNaverUserInfo(access_token);

		// 기존에 카카오 ID로 로그인한 적이 있는지 확인
		UserDto udto_old = userService.getUserByNaverId(udto.getNaver_id());
		// 로그인 정보가 있으면 (=kakao_id 컬럼에서 같은 값이 있는 게 확인되면) 그걸 불러온다
		if (udto_old != null) {
			udto = udto_old;
		} else {  // 아니라면 새로운 유저를 생성한다
			userService.insertUser(udto);
		}

		//유지 시간 설정
		//session.setMaxInactiveInterval(result);
		session.setMaxInactiveInterval(60*60*4);//4시간 유지
		//로그인한 아이디에 대한 정보를 얻어서 세션에 저장
		session.setAttribute("loginok", "yes");
		session.setAttribute("user_num", udto.getUser_num());
		session.setAttribute("kakao_id", udto.getKakao_id());
		session.setAttribute("naver_id", udto.getNaver_id());
		session.setAttribute("loginid", udto.getLoginid());
		session.setAttribute("password", udto.getPassword());
		session.setAttribute("loginname", udto.getName());
		session.setAttribute("nickname", udto.getNickname());
		session.setAttribute("email", udto.getEmail());
		session.setAttribute("profile", udto.getProfile());
		session.setAttribute("loginphoto", udto.getProfilephoto());
		session.setAttribute("loginhp", udto.getHp());
		session.setAttribute("isadmin",udto.getIsadmin());
		session.setAttribute("alarm", udto.getAlarm());
		session.setAttribute("interest", udto.getInterest());
		// userDto = userService.getAgreementInfo(access_token);
		return "redirect:/";
	}

	@GetMapping("/login")
	@ResponseBody
	public Map<String , String> loginprocess(String loginid, String password,HttpSession session)
	{
		//System.out.println(id);


		Map<String, String> map=new HashMap<String, String>();
		int result=userService.getLoginIdPasswordCheck(loginid, password);
		if(result==1)//아이디,패스 맞는 경우
		{
			//유지 시간 설정
			//session.setMaxInactiveInterval(result);
			session.setMaxInactiveInterval(60*60*4);//4시간 유지
			//로그인한 아이디에 대한 정보를 얻어서 세션에 저장
			UserDto udto=userService.getDataByLoginId(loginid);
			session.setAttribute("loginok", "yes");
			session.setAttribute("user_num", udto.getUser_num());
			session.setAttribute("loginid", udto.getLoginid());
			session.setAttribute("password", udto.getPassword());
			session.setAttribute("loginname", udto.getName());
			session.setAttribute("nickname", udto.getNickname());
			session.setAttribute("email", udto.getEmail());
			session.setAttribute("profile", udto.getProfile());
			session.setAttribute("loginphoto", udto.getProfilephoto());
			session.setAttribute("loginhp", udto.getHp());
			session.setAttribute("isadmin",udto.getIsadmin());
			session.setAttribute("alarm", udto.getAlarm());
			session.setAttribute("interest", udto.getInterest());

			
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
		session.removeAttribute("user_num");
		session.removeAttribute("loginid");
		session.removeAttribute("password");
		session.removeAttribute("loginname");
		session.removeAttribute("nickname");
		session.removeAttribute("email");
		session.removeAttribute("profile");
		session.removeAttribute("loginphoto");
		session.removeAttribute("loginhp");
		session.removeAttribute("isadmin");
		session.removeAttribute("alarm");
		session.removeAttribute("interest");
	}
	
	

}





































