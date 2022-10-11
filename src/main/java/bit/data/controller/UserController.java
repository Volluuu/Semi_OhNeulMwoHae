package bit.data.controller;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")//앞의 공통적으로 들어가는 매핑을 설정하는 annotation
public class UserController {

    @Autowired
    UserServiceInter userService;

    final DefaultMessageService messageService;

    public UserController() {
        this.messageService = NurigoApp.INSTANCE.initialize("NCSNEBVIMIQMPMQO", "VDFIF8POOXXQVXHVYZ7OJTIA6NKMYBUW", "https://api.coolsms.co.kr");
    }

    

    @GetMapping("/list")
    public String ulist(Model model)
    {
        //총 멤버 인원수를 db에서 얻는다
        int totalCount=userService.getTotalCount();

        //전체 멤버 데이터를 가져온다
        List<UserDto> list=userService.getAllUsers();

        //model에 저장
        model.addAttribute("totalCount",totalCount);
        model.addAttribute("list",list);

        return "/bit/user/userlist";
    }

    @GetMapping("/userform")
    public String uform(@RequestParam(required = false) String login_channel, HttpSession session)
    {
        // 카카오/네이버 로그인 시도 후 일반 회원가입할 때 꼬이는 것 방지
        if (login_channel == null) {
            session.setMaxInactiveInterval(60*60*4);//4시간 유지
            session.setAttribute("login_channel", "none");
            session.setAttribute("kakao_id", null);
            session.setAttribute("naver_id", null);
            session.setAttribute("loginid", null);
            session.setAttribute("password", null);
            session.setAttribute("loginname", null);
            session.setAttribute("nickname", null);
            session.setAttribute("age", null);
            session.setAttribute("gender", null);
            session.setAttribute("email", null);
            session.setAttribute("profile", null);
            session.setAttribute("loginphoto", null);
            session.setAttribute("loginhp", null);
            session.setAttribute("isadmin",null);
            session.setAttribute("alarm", null);
            session.setAttribute("interest", null);
        }
        return "/bit/user/userform";
    }

    @GetMapping("/userlogin")
    public String ulogin()
    {
        return "/bit/user/userlogin";
    }

    @GetMapping("/userid")
    public String uid()
    {
        return "/bit/user/userid";
    }

    @GetMapping("/userpassword")
    public String upassword()
    {
        return "/bit/user/userpassword";
    }


    @PostMapping("/findid")
    public String findid(UserDto userdto,Model model){
        System.out.println("name="+ userdto.getName());
        if(userService.findIdCheckByName(userdto.getName())==0) {
            model.addAttribute("msg", "이름을 확인해주세요");
            return "/bit/user/userid";
        }else {
            model.addAttribute("user", userService.findIdByName(userdto.getName()));
            return "/bit/user/findid";
        }
    }

    @PostMapping("/insert")
    public String insert(HttpServletRequest request, UserDto dto, MultipartFile myphoto, HttpSession session)// MemberDto dto은 모델앤뷰 생략
    {
        try {
            // Tom cat에 올라간upload 폴더 경로
            String path = request.getSession().getServletContext().getRealPath("/resources/upload");
            System.out.println(path);
            //저장할 파일명 구하기
            String fileName = ChangeName.getChangeFileName(myphoto.getOriginalFilename());
            //dto에 photo에 저장
            dto.setProfilephoto(fileName);
            //upload try/catch
            myphoto.transferTo(new File(path + "/" + fileName));
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            System.out.println("dto: " + dto);

            // 네이버/카카오 로그인 시 각각의 고유 ID 반영
            Object loginChannelObj = session.getAttribute("login_channel");
            if (loginChannelObj != null)
            {
                String loginChannel = (String) loginChannelObj;
                if (loginChannel.equals("kakao_id")) {
                    Object kakaoIdObj = session.getAttribute("kakao_id");
                    if (kakaoIdObj != null) {
                        dto.setKakao_id((long) kakaoIdObj);
                    }
                } else if (loginChannel.equals("naver_id")) {
                    Object naverIdObj = session.getAttribute("naver_id");
                    if (naverIdObj != null) {
                        dto.setNaver_id((String) naverIdObj);
                    }
                }
            }
            //db insert (성공했을때만 업로드되도록 try에 배치)
            userService.insertUser(dto);
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }


        return "redirect:/"; // /member/list 맵핑주소 호출 - controller메서드 호출.redirect라 url주소도 바뀜
    }

    //아이디 체크하는 메서드
    @GetMapping("/loginidcheck")
    @ResponseBody //json 반환 annotation
    public Map<String, Integer> getLoginIdSearch(@RequestParam Map<String, String> param)
    {
        String loginid = param.get("loginid");
        Map<String, Integer> map=new HashMap<String, Integer>();
        int count=userService.getLoginIdSearch(loginid);//아이디가 있을 경우 1, 아니면 0을 반환하는 메서드

        System.out.println("loginid : " + loginid + ", count : " + count);
        map.put("count", count);//조회된 id에 값을 저장

        return map;
    }

    @GetMapping("/loginNicknameCheck")
    @ResponseBody //json 반환 annotation
    public Map<String, Integer> loginNicknameCheck(@RequestParam Map<String, String> param) {
        String nickname = param.get("nickname");
        Map<String, Integer> map = new HashMap<String, Integer>();
        int count = userService.loginNicknameCheck(nickname);//아이디가 있을 경우 1, 아니면 0을 반환하는 메서드

        System.out.println("nickname : " + nickname + ", count : " + count);
        map.put("count", count);//조회된 id에 값을 저장

        return map;
    }

    @GetMapping("/loginPasswordCheck")
    @ResponseBody //json 반환 annotation
    public Map<String, Object> loginPasswordCheck(@RequestParam Map<String, String> param, HttpSession session) {
        int user_num = (int) session.getAttribute("user_num");

        String originPassword = param.get("originPassword");
        Map<String, Object> map = new HashMap<>();


        UserDto userDto = userService.getDataByUserNum(user_num);//아이디가 있을 경우 1, 아니면 0을 반환하는 메서드

        if (userDto == null) {
            map.put("code", 1);//결과 코드
            map.put("msg", "해당 유저가 존재하지 않습니다.");//결과 메세지
        } else if (!userDto.getPassword().equals(originPassword)) {
            map.put("code", 2);//결과 코드
            map.put("msg", "비밀번호가 일치하지 않습니다.");//결과 메세지
        } else {
            map.put("code", 0);//결과 코드
            map.put("msg", "성공입니다.");//결과 메세지
        }
        return map;
    }

    //수정
    @PostMapping("/updateprofilephoto")
    @ResponseBody
    public void photoUpload(int user_num, MultipartFile profilephoto, HttpServletRequest request, HttpSession session)
    {
        // Tom cat에 올라간upload 폴더 경로
        String path=request.getSession().getServletContext().getRealPath("/resources/upload");
        System.out.println(path);
        //저장할 파일명 구하기
        String fileName=ChangeName.getChangeFileName(profilephoto.getOriginalFilename());

        //upload

        try {
            profilephoto.transferTo(new File(path+"/"+fileName));

            //db에 사진 수정
            userService.updateProfilePhoto(user_num, fileName);
            //세션에 사진 변경
            session.setAttribute("profilephoto", fileName);

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
    public void delete(int user_num,HttpSession session)
    {
        userService.deleteUser(user_num);
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
    public UserDto getData(int user_num)
    {
        return userService.getDataByUserNum(user_num);
    }

    //수정
    @PostMapping("/update")
    @ResponseBody
    public void update(UserDto dto,HttpSession session)
    {
        userService.updateUser(dto);

        //세션에 저장된 이름도 변경하기
        session.setAttribute("loginname", dto.getName());
        session.setAttribute("loginhp", dto.getHp());
        session.setAttribute("loginemail", dto.getEmail());


    }

    /**
     * 단일 메시지 발송 예제
     */
    @PostMapping("/send-one")
    @ResponseBody
    public SingleMessageSentResponse sendOne(@RequestParam Map<String, String> param) {

        String hp = param.get("hp").replace("-", "");
        String correctAuthNum = param.get("correctAuthNum");

        Message message = new Message();
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01030093934");
        message.setTo(hp);
        message.setText(correctAuthNum);

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);

        return response;
    }

}