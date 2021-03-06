package member.model.vo;

public class Member {

	private String mem_id;
	private String mem_pw ;
	private String mem_name;
	private int mem_birthdate;
	private String mem_phone;
	private String mem_email;
	private String  mem_addr;
	
	public Member() {}

	
	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public String getMem_pw() {
		return mem_pw;
	}


	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}


	public String getMem_name() {
		return mem_name;
	}


	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}


	public int getMem_birthdate() {
		return mem_birthdate;
	}


	public void setMem_birthdate(int mem_birthdate) {
		this.mem_birthdate = mem_birthdate;
	}


	public String getMem_phone() {
		return mem_phone;
	}


	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}


	public String getMem_email() {
		return mem_email;
	}


	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}


	public String getMem_addr() {
		return mem_addr;
	}


	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}


	public Member(String mem_id, String mem_pw, String mem_name, int mem_birthdate, String mem_phone, String mem_email,
			String mem_addr) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_birthdate = mem_birthdate;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
		this.mem_addr = mem_addr;
	}


	@Override
	public String toString() {
		return "Member [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", mem_birthdate="
				+ mem_birthdate + ", mem_phone=" + mem_phone + ", mem_email=" + mem_email + ", mem_addr=" + mem_addr
				+ "]";
	}

	
}