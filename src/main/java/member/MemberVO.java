package member;

import java.sql.Date;

public class MemberVO {

	private int age;
	private String name,id,pw,gender,filename,post,addr,email,tel,admin;
	private Date birth;
	
	public MemberVO() {
		super();
	}

	public MemberVO(int age, String name, String id, String pw, String gender, String filename, String post,
			String addr, String email, String tel, String admin, Date birth) {
		super();
		this.age = age;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.filename = filename;
		this.post = post;
		this.addr = addr;
		this.email = email;
		this.tel = tel;
		this.admin = admin;
		this.birth = birth;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}
		
}
