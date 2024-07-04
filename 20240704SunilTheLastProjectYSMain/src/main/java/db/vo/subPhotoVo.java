package db.vo;

public class subPhotoVo {

	int		sub_p_idx;
	String	sub_p_title;
	String	sub_p_category;
	int		sub_p_min_player;
	int		sub_p_max_player;
	int		sub_p_playtime;
	int		sub_p_age;
	int		sub_p_year;
	String	sub_p_publisher;
	String	sub_p_filename;
	String	sub_p_detail_loc;
	int		mem_idx;
	String	mem_name;
	
	public subPhotoVo() {

	}

	

	public subPhotoVo(String sub_p_category) {
		super();
		this.sub_p_category = sub_p_category;
	}



	public subPhotoVo(String sub_p_title, String sub_p_category,
			int sub_p_min_player, int sub_p_max_player, int sub_p_playtime, int sub_p_age, int sub_p_year,
			String sub_p_publisher, String sub_p_filename, String sub_p_detail_loc) {
		super();
		this.sub_p_title = sub_p_title;
		this.sub_p_category = sub_p_category;
		this.sub_p_filename = sub_p_filename;
		this.sub_p_min_player = sub_p_min_player;
		this.sub_p_max_player = sub_p_max_player;
		this.sub_p_playtime = sub_p_playtime;
		this.sub_p_age = sub_p_age;
		this.sub_p_year = sub_p_year;
		this.sub_p_publisher = sub_p_publisher;
		this.sub_p_detail_loc = sub_p_detail_loc;
	}


	

	public subPhotoVo(int sub_p_idx, String sub_p_title, String sub_p_category, int sub_p_min_player,
			int sub_p_max_player, int sub_p_playtime, int sub_p_age, int sub_p_year, String sub_p_publisher) {
		super();
		this.sub_p_idx = sub_p_idx;
		this.sub_p_title = sub_p_title;
		this.sub_p_category = sub_p_category;
		this.sub_p_min_player = sub_p_min_player;
		this.sub_p_max_player = sub_p_max_player;
		this.sub_p_playtime = sub_p_playtime;
		this.sub_p_age = sub_p_age;
		this.sub_p_year = sub_p_year;
		this.sub_p_publisher = sub_p_publisher;
	}



	public int getSub_p_idx() {
		return sub_p_idx;
	}



	public void setSub_p_idx(int sub_p_idx) {
		this.sub_p_idx = sub_p_idx;
	}



	public String getSub_p_title() {
		return sub_p_title;
	}



	public void setSub_p_title(String sub_p_title) {
		this.sub_p_title = sub_p_title;
	}



	public String getSub_p_category() {
		return sub_p_category;
	}



	public void setSub_p_category(String sub_p_category) {
		this.sub_p_category = sub_p_category;
	}



	public int getSub_p_min_player() {
		return sub_p_min_player;
	}



	public void setSub_p_min_player(int sub_p_min_player) {
		this.sub_p_min_player = sub_p_min_player;
	}



	public int getSub_p_max_player() {
		return sub_p_max_player;
	}



	public void setSub_p_max_player(int sub_p_max_player) {
		this.sub_p_max_player = sub_p_max_player;
	}



	public int getSub_p_playtime() {
		return sub_p_playtime;
	}



	public void setSub_p_playtime(int sub_p_playtime) {
		this.sub_p_playtime = sub_p_playtime;
	}



	public int getSub_p_age() {
		return sub_p_age;
	}



	public void setSub_p_age(int sub_p_age) {
		this.sub_p_age = sub_p_age;
	}



	public int getSub_p_year() {
		return sub_p_year;
	}



	public void setSub_p_year(int sub_p_year) {
		this.sub_p_year = sub_p_year;
	}



	public String getSub_p_publisher() {
		return sub_p_publisher;
	}



	public void setSub_p_publisher(String sub_p_publisher) {
		this.sub_p_publisher = sub_p_publisher;
	}



	public String getSub_p_filename() {
		return sub_p_filename;
	}



	public void setSub_p_filename(String sub_p_filename) {
		this.sub_p_filename = sub_p_filename;
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



	public String getSub_p_detail_loc() {
		return sub_p_detail_loc;
	}



	public void setSub_p_detail_loc(String sub_p_detail_loc) {
		this.sub_p_detail_loc = sub_p_detail_loc;
	}
	
	

}
