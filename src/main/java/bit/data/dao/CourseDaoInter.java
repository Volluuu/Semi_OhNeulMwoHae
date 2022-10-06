package bit.data.dao;

import bit.data.dto.CourseDto;
import bit.data.dto.CafeDto;
import bit.data.dto.TripDto;
import bit.data.dto.FoodDto;


import java.util.List;
import java.util.Map;

public interface CourseDaoInter {
	public List<CourseDto> getAllCourses(int user_num);
	public CourseDto getCourse();
	public void insertCourse(CourseDto dto);
	public void deleteCourse(int num);
	public void updateStep(Map<String, String> map);
	public List<CourseDto> getSearchList(Map<String, String> map);
	public List<CafeDto> getSearchCafe(Map<String, String> map);
	public List<TripDto> getSearchTrip(Map<String, String> map);
	public List<FoodDto> getSearchFood(Map<String, String> map);

	public CafeDto getCafeLatLon(int course_num);
	public FoodDto getFoodLatLon(int course_num);
	public TripDto getTripLatLon(int course_num);
}
