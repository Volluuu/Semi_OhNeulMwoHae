package bit.data.controller;

import bit.data.dto.CourseDto;
import bit.data.dto.CafeDto;
import bit.data.dto.TripDto;
import bit.data.dto.FoodDto;
import bit.data.service.CafeServiceInter;
import bit.data.service.CourseService;
import bit.data.service.CourseServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CourseController {
	@Autowired
	CourseServiceInter courseService;

	@Autowired
	CafeServiceInter cafeService;

	@GetMapping("/help/map")
	public String help(@RequestParam(value = "user_num", required = false) int user_num,
	                   Model model, HttpSession session) {
//		int user_num = session.getAttribute("user_num");

		List<CourseDto> list = courseService.getAllCourses(user_num);

		model.addAttribute("list", list);

		return "/bit/help/googlemap";
	}

	/* 코스 리스트 출력 */
	@GetMapping("/course/searchlist")
	@ResponseBody
	public List<? extends Object> courselist(
			@RequestParam(value = "searchthema", required = false) String st,
			@RequestParam(value = "searchword", required = false) String sw
	) {
		if (st.equals("cafe")) {
			List<CafeDto> list = courseService.getSearchCafe(sw);
			System.out.println(list.size());
			return list;
		}
		if (st.equals("trip")) {
			List<TripDto> list = courseService.getSearchTrip(sw);
			return list;
		}
		if (st.equals("food")) {
			List<FoodDto> list = courseService.getSearchFood(sw);
			return list;
		}
		return null;
	}

	@GetMapping("/course/getlatlon")
	@ResponseBody
	public Object getlatlon(@RequestParam String course_type, @RequestParam int course_num) {
		if (course_type.equals("cafe")) {
			System.out.println(course_type + "and" + course_num);
			CafeDto dto = new CafeDto();
			dto = courseService.getCafeLatLon(course_num);
			return dto;
		} else if (course_type.equals("food")) {
			FoodDto dto = new FoodDto();
			dto = courseService.getFoodLatLon(course_num);
			return dto;
		} else if (course_type.equals("trip")) {
			TripDto dto = new TripDto();
			dto = courseService.getTripLatLon(course_num);
			return dto;
		} else {
			return null;
		}

	}

	@PostMapping("/course/insertcourse")
	@ResponseBody
	public void insertCourse(@RequestParam(value = "user_num" , required = false) int user_num,
	                         @RequestParam(value = "cnt" , required = false) int cnt,
	                         @RequestParam(value = "title" , required = false) String title,
	                         @RequestParam(value = "step1" , required = false) String step1,
	                         @RequestParam(value = "step2" , required = false) String step2,
	                         @RequestParam(value = "step3" , required = false) String step3,
	                         @RequestParam(value = "step4" , required = false) String step4,
	                         @RequestParam(value = "step5" , required = false) String step5) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_num", user_num);
		map.put("cnt", cnt);
		map.put("title", title);
		map.put("step1", step1);
		map.put("step2", step2);
		map.put("step3", step3);
		map.put("step4", step4);
		map.put("step5", step5);

		courseService.insertCourse(map);
	}
	@PostMapping("/course/deletecourse")
	@ResponseBody
	public void deleteCourse(@RequestParam(value="course_num") int course_num){
		courseService.deleteCourse(course_num);
	}

}
