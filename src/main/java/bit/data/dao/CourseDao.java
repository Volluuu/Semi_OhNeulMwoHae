package bit.data.dao;

import bit.data.dto.CourseDto;
import bit.data.dto.CafeDto;
import bit.data.dto.TripDto;
import bit.data.dto.FoodDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CourseDao implements CourseDaoInter{

	@Autowired
	SqlSession session;
	String ns = "bit.data.dao.CourseDao.";

	@Override
	public List<CourseDto> getAllCourses(int user_num) {
		return session.selectList(ns+"getAllCourses", user_num);
	}


	@Override
	public CourseDto getCourse() { //필요없어보임
		return null;
	}

	@Override
	public void insertCourse(CourseDto dto) {
		session.insert(ns+"insertCourse", dto);
	}

	@Override
	public void deleteCourse(int num) {
		session.delete(ns+"deleteCourse", num);
	}

	@Override
	public void updateStep(Map<String, String> map) {
		session.update(ns+"updateStep", map);
	}

	@Override
	public List<CourseDto> getSearchList(Map<String, String> map) {
		return session.selectList(ns+"getSearchList", map);
	}

	@Override
	public List<CafeDto> getSearchCafe(Map<String, String> map) {
		return session.selectList(ns+"getSearchCafe",map);
	}

	@Override
	public List<TripDto> getSearchTrip(Map<String, String> map) {
		return session.selectList(ns+"getSearchTrip",map);
	}

	@Override
	public List<FoodDto> getSearchFood(Map<String, String> map) {
		return session.selectList(ns+"getSearchFood",map);
	}
	@Override
	public CafeDto getCafeLatLon(int course_num) {
		return session.selectOne(ns + "getCafeLatLon", course_num);
	}

	@Override
	public FoodDto getFoodLatLon(int course_num) {
		return session.selectOne(ns + "getFoodLatLon", course_num);
	}

	@Override
	public TripDto getTripLatLon(int course_num) {
		return session.selectOne(ns + "getTripLatLon", course_num);
	}
}
