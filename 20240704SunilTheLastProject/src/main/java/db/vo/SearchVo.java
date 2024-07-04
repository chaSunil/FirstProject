package db.vo;

public class SearchVo {
	
	int game_idx;
	String name;
	String link;
	String filename;
	
	public SearchVo() {
		// TODO Auto-generated constructor stub
	}
	
	public int getGame_idx() {
		return game_idx;
	}
	public void setGame_idx(int game_idx) {
		this.game_idx = game_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}

}
