package bit.data.dao;

import bit.data.dto.CourseDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
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

}
