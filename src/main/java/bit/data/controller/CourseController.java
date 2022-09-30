package bit.data.controller;

import bit.data.dto.CourseDto;
import bit.data.service.CourseService;
import bit.data.service.CourseServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

	/* 코스 리스트 출력 */
	@GetMapping("/course/searchlist")
	public String courselist(
			@RequestParam(value = "searchthema" ,required = false) String st,
			@RequestParam(value = "searchword" ,required = false) String sw,
			Model model
	)
	{
		//페이지에서 보여질 글만 가져오기
		List<CourseDto> list=courseService.getSearchList(st, sw);

		//request 출력
		model.addAttribute("list",list);

		return "/bit/help/googlemap";
	}
}
