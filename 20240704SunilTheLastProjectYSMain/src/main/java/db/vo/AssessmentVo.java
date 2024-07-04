package db.vo;

public class AssessmentVo {
	int a_idx;
	int a_no; // 조회되었을 때 글 순서
	String a_regdate;
	String a_ip;
	String a_content;
	int mem_idx;
	String mem_nickname;
	String a_cate;
	
	public AssessmentVo() {
		// TODO Auto-generated constructor stub
	}
	
	// 추가용 생성자
	public AssessmentVo(String a_ip, String a_content, int mem_idx, String mem_nickname, String a_cate) {
		super();
		this.a_ip = a_ip;
		this.a_content = a_content;
		this.mem_idx = mem_idx;
		this.mem_nickname = mem_nickname;
		this.a_cate = a_cate;
	}
	
	// 수정용 생성자
	
	public AssessmentVo(int a_idx, String a_ip, String a_content, String a_cate) {
		super();
		this.a_idx = a_idx;
		this.a_ip = a_ip;
		this.a_content = a_content;
		this.a_cate = a_cate;
	}
		
	public String getA_cate() {
		return a_cate;
	}

	public void setA_cate(String a_cate) {
		this.a_cate = a_cate;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public int getA_idx() {
		return a_idx;
	}
	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}
	public String getA_ip() {
		return a_ip;
	}
	public void setA_ip(String a_ip) {
		this.a_ip = a_ip;
	}
	public String getA_regdate() {
		return a_regdate;
	}
	public void setA_regdate(String a_readate) {
		this.a_regdate = a_readate;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	
	
}