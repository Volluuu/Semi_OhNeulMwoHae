package bit.data.controller;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;
import com.mysql.cj.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

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

        String image = "noimage.png";
        if (userDto.getProfilephoto() != null && !"".equals(userDto.getProfilephoto())) {
            image = userDto.getProfilephoto();
        }
        model.addAttribute("profilephoto", "/resources/upload/" + image);
        model.addAttribute("nickname", userDto.getNickname());
        model.addAttribute("hp", userDto.getHp());
        model.addAttribute("age", userDto.getAge());
        model.addAttribute("interest", userDto.getInterest());
        model.addAttribute("profile", userDto.getProfile());

        return "/bit/mypage/mypagedetail";
    }

    @PostMapping("/update")
    public String update(UserDto newUserDto, MultipartFile findupload, HttpServletRequest request) {
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
        HttpSession session = request.getSession();
        int user_num = (Integer) session.getAttribute("user_num");
        if (findupload != null && findupload.getOriginalFilename() != null && !"".equals(findupload.getOriginalFilename())) {
            String filename = "1_" + ChangeName.getChangeFileName(findupload.getOriginalFilename());
            System.out.println("filename : " + filename);
            try {
                findupload.transferTo(new File(path + "/" + filename));
                if (filename != null && !filename.equals("")) {
                    userService.updateProfilePhoto(user_num, filename);
                }
            } catch (IOException | IllegalStateException e) {
                System.out.println("filename : " + filename);
                throw new RuntimeException(e);
            }
        }

        UserDto userDto = userService.getDataByUserNum(user_num);
        if (newUserDto.getNickname() != null && !newUserDto.getNickname().equals(userDto.getNickname())) {
            userDto.setNickname(newUserDto.getNickname());
        }

        if (newUserDto.getHp() != null && !newUserDto.getHp().equals(userDto.getHp())) {
            userDto.setHp(newUserDto.getHp());
        }

        if (newUserDto.getAge() != null && !newUserDto.getAge().equals(userDto.getAge())) {
            userDto.setAge(newUserDto.getAge());
        }

        if (newUserDto.getProfile() != null && !newUserDto.getProfile().equals(userDto.getProfile())) {
            userDto.setProfile(newUserDto.getProfile());
        }

        if (newUserDto.getInterest() != null && !newUserDto.getInterest().equals(userDto.getInterest())) {
            userDto.setInterest(newUserDto.getInterest());
        }

        userService.updateUser(userDto);

        return "redirect:/mypage/mypagedetail";
    }

    @PostMapping("/updatePassword")
    public String updatePassword(UserDto newUserDto, HttpServletRequest request) {
        HttpSession session = request.getSession();

        int user_num = (Integer) session.getAttribute("user_num");

        UserDto userDto = userService.getDataByUserNum(user_num);

        userDto.setPassword(newUserDto.getPassword());

        userService.updateUser(userDto);

        return "redirect:/mypage/mypagedetail";
    }

    @PostMapping("/delete")
    public String delete(HttpServletRequest request) {
        HttpSession session = request.getSession();

        int user_num = (Integer) session.getAttribute("user_num");

        userService.deleteUser(user_num);
        session.removeAttribute("loginok");
        session.removeAttribute("loginid");
        session.removeAttribute("loginname");
        session.removeAttribute("loginphoto");
        session.removeAttribute("loginhp");
        session.removeAttribute("loginemail");

        return "redirect:/";
    }

}
