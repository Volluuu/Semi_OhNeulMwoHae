package bit.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FindController {

    @GetMapping("/findboard/list")
    public String findBoard() {
        return "/bit/find/findboard";
    }
}
