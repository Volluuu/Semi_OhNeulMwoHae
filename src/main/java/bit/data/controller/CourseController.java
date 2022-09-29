package bit.data.controller;

import bit.data.service.CourseServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CourseController {
	@Autowired
	CourseServiceInter courseService;

	@GetMapping("/help/map")
	public String help()
	{

		return "/bit/help/googlemap";
	}

}
