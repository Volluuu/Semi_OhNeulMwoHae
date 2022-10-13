package com.bit.semi;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {

    @GetMapping("/")
    public String index() {
        return "/bit3/layout/index";// /WEB-INF/layout/main.jsp가 메인페이지로
    }

    @GetMapping("/home")
    public String home() {
        return "/bit/layout/main";// /WEB-INF/layout/main.jsp가 메인페이지로
    }


}
