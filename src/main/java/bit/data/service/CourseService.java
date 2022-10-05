package bit.data.service;

import bit.data.dao.CourseDaoInter;
import bit.data.dto.CafeDto;
import bit.data.dto.CourseDto;
import bit.data.dto.FoodDto;
import bit.data.dto.TripDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CourseService implements CourseServiceInter{

	@Autowired
	CourseDaoInter daoInter;
	@Override
	public List<CourseDto> getAllCourses(int user_num) {
		List<CourseDto> list = new ArrayList<CourseDto>();
		list = daoInter.getAllCourses(user_num);
		return list;
	}

	@Override
	public CourseDto getCourse() { // 필요없어보임
		return null;
	}

	@Override
	public void insertCourse(CourseDto dto) {
		daoInter.insertCourse(dto);
	}

	@Override
	public void deleteCourse(int num) {
		daoInter.deleteCourse(num);
	}

	@Override
	public void updateStep(String num, String newStep) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("num", num);
		map.put("newStep", newStep);
		daoInter.updateStep(map);
	}

	@Override
	public List<CourseDto> getSearchList(String searchthema, String searchword) {
		Map<String, String> map=new HashMap<String, String>();

		map.put("searchthema", searchthema);
		map.put("searchword", searchword);

		return daoInter.getSearchList(map);
	}

	@Override
	public List<CafeDto> getSearchCafe(String searchword) {
		Map<String,String> map=new HashMap<String, String>();


		map.put("searchword",searchword);

		return daoInter.getSearchCafe(map);
	}

	@Override
	public List<TripDto> getSearchTrip(String searchword) {
		Map<String, String> map = new HashMap<String, String>();

		map.put("searchword", searchword);

		return daoInter.getSearchTrip(map);
	}

	@Override
	public List<FoodDto> getSearchFood(String searchword){
		Map<String, String> map = new HashMap<String, String>();

		map.put("searchword", searchword);

		return daoInter.getSearchFood(map);
	}

	@Override
	public CafeDto getCafeLatLon(int course_num) {
		return daoInter.getCafeLatLon(course_num);
	}

	@Override
	public FoodDto getFoodLatLon(int course_num) {
		return daoInter.getFoodLatLon(course_num);
	}

	@Override
	public TripDto getTripLatLon(int course_num) {
		return daoInter.getTripLatLon(course_num);
	}
}

