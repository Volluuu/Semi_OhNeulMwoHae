package bit.data.controller;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

    @Autowired
    private UserServiceInter userService;


    @GetMapping("/mypagedetail")
    public String mypagedetail(Model model, HttpSession session) {

        String loginid = (String) session.getAttribute("loginid");
        UserDto userDto = userService.getDataByLoginId(loginid);

        System.out.println("userDto: " + userDto);

        //model.addAttribute("profilephoto", "/resources/upload/" + userDto.getProfilephoto());
        model.addAttribute("profilephoto", "/resources/upload/noimage.png");
        model.addAttribute("nickname", userDto.getNickname());
        model.addAttribute("hp", userDto.getHp());
        model.addAttribute("age", userDto.getAge());

        return "/bit/mypage/mypagedetail";
    }

}
