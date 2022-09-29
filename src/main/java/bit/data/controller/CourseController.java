package bit.data.controller;

import bit.data.dto.CourseDto;
import bit.data.service.CourseServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CourseController {
	@Autowired
	CourseServiceInter courseService;

	@GetMapping("/help/map")
	public String help(@RequestParam(value="user_num", required = false) int user_num,
	                   Model model, HttpSession session)
	{
//		int user_num = session.getAttribute("user_num");

		List<CourseDto> list = courseService.getAllCourses(user_num);



		model.addAttribute("list", list);
		return "/bit/help/googlemap";
	}

}
