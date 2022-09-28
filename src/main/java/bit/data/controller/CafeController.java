package bit.data.controller;

import bit.data.service.CafeServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class CafeController {

    @Autowired
    CafeServiceInter cafeService;
    

}
