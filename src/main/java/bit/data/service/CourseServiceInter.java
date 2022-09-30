package bit.data.service;

import bit.data.dto.CourseDto;

import java.util.List;
import java.util.Map;

public interface CourseServiceInter {
	public List<CourseDto> getAllCourses(int user_num);
	public CourseDto getCourse();
	public void insertCourse(CourseDto dto);
	public void deleteCourse(int num);
	public void updateStep(String num, String newStep);
	public List<CourseDto> getSearchList(String searchcolumn,String searchword);
}
