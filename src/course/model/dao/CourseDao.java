package course.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import course.model.vo.Course;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class CourseDao {

	private Properties prop;
	
	public CourseDao() {
		prop = new Properties();
		
		try {
			String file = MemberDAO.class.getResource("/sql/course/course-sql.properties").getPath();
			prop.load(new FileReader(file));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	public List<Course> selectCourse(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Course> clist = new ArrayList<>();
		Course c = null;
		String sql = prop.getProperty("selectCourse");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				c = new Course();
				c.setCourseNum(rs.getInt(1));
				c.setCourseName(rs.getString(2));
				c.setShopId(rs.getString(3));
				
				clist.add(c);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return clist;
	}

}
