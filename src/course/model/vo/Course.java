package course.model.vo;

public class Course {
	
	private int courseNum;
	private String courseName;
	private String shopId;
	
	public Course() {}

	
	public Course(int courseNum, String courseName, String shopId) {
		super();
		this.courseNum = courseNum;
		this.courseName = courseName;
		this.shopId = shopId;
	}


	public int getCourseNum() {
		return courseNum;
	}

	public void setCourseNum(int courseNum) {
		this.courseNum = courseNum;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}


	@Override
	public String toString() {
		return "Course [courseNum=" + courseNum + ", courseName=" + courseName + ", shopId=" + shopId + "]";
	}
	
	
}
