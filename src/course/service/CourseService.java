package course.service;

import java.sql.Connection;
import java.util.List;
import static common.JDBCTemplate.*;

import course.model.dao.CourseDao;
import course.model.vo.Course;
import gift.model.dao.GiftDAO;
import member.model.vo.Member;

public class CourseService {

	public List<Course> selectCourse(String id) {
		Connection conn = getConnection();
		List<Course> clist = new CourseDao().selectCourse(conn, id);
		close(conn);
		return clist;
	}

}
