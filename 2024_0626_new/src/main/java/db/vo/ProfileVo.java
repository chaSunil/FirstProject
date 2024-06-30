package db.vo;

public class ProfileVo {

	
	int p_idx;
	String p_content;
	String b_filename;
	String p_filename;
	String p_ip;
	int mem_idx;
	String mem_name;
	String mem_nickname;

	public ProfileVo(String p_content, String b_filename, String p_filename, String p_ip, String mem_name,
			String mem_nickname) {
		super();
		this.p_content = p_content;
		this.b_filename = b_filename;
		this.p_filename = p_filename;
		this.p_ip = p_ip;
		this.mem_name = mem_name;
		this.mem_nickname = mem_nickname;
	}
	

	public ProfileVo(String p_ip, int mem_idx, String mem_name, String mem_nickname) {
		super();
		this.p_ip = p_ip;
		this.mem_idx = mem_idx;
		this.mem_name = mem_name;
		this.mem_nickname = mem_nickname;
	}



	public ProfileVo() {
	}
	
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getB_filename() {
		return b_filename;
	}
	public void setB_filename(String b_filename) {
		this.b_filename = b_filename;
	}
	public String getP_filename() {
		return p_filename;
	}
	public void setP_filename(String p_filename) {
		this.p_filename = p_filename;
	}
	public String getP_ip() {
		return p_ip;
	}
	public void setP_ip(String p_ip) {
		this.p_ip = p_ip;
	}
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	
	
	
}
