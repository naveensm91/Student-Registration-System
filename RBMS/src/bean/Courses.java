package bean;

// TODO: Auto-generated Javadoc
/**
 * The Class Courses.
 */
/**
 * @author naveen
 *
 */
public class Courses {

	/** The Dept code. */
	private String DeptCode;
	
	/** The course number. */
	private long courseNumber;
	
	/** The title. */
	private String title;
	
	/**
	 * Gets the dept code.
	 *
	 * @return the deptCode
	 */
	public String getDeptCode() {
		return DeptCode;
	}
	
	/**
	 * Sets the dept code.
	 *
	 * @param deptCode the deptCode to set
	 */
	public void setDeptCode(String deptCode) {
		DeptCode = deptCode;
	}
	
	/**
	 * Gets the course number.
	 *
	 * @return the courseNumber
	 */
	public long getCourseNumber() {
		return courseNumber;
	}
	
	/**
	 * Sets the course number.
	 *
	 * @param courseNumber the courseNumber to set
	 */
	public void setCourseNumber(long courseNumber) {
		this.courseNumber = courseNumber;
	}
	
	/**
	 * Gets the title.
	 *
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	
	/**
	 * Sets the title.
	 *
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
}
