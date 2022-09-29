package bit.data.dao;

import bit.data.dto.CourseDto;

import java.util.List;
import java.util.Map;

public interface CourseDaoInter {
	public List<CourseDto> getAllCourses(int user_num);
	public CourseDto getCourse();
	public void insertCourse(CourseDto dto);
	public void deleteCourse(int num);
	public void updateStep(Map<String, String> map);
}
