package vo;

public class AuctionVo {
	
	int 	a_idx;				// 경매번호
	int 	a_initial_price;	// 최초 입찰가
	int 	a_direct_price;		// 즉시 거래가
	String  a_regtime;			// 경매 등록시간
	String  a_selltime;			// 판매 시간
	String	a_endtime;			// 완료 시간
	String	a_sledding;			// 경매 진행상태
	int		item_idx;			// 아이템 일련번호(거래번호)
	int 	mem_idx; 			// 판매자 회원번호
	String  mem_name;			// 판매자 이름
	int mem_point;				// 판매자 포인트
	
	
	public String getA_endtime() {
		return a_endtime;
	}
	public void setA_endtime(String a_endtime) {
		this.a_endtime = a_endtime;
	}
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}
	public int getA_idx() {
		return a_idx;
	}
	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}
	public int getA_initial_price() {
		return a_initial_price;
	}
	public void setA_initial_price(int a_initial_price) {
		this.a_initial_price = a_initial_price;
	}
	public int getA_direct_price() {
		return a_direct_price;
	}
	public void setA_direct_price(int a_direct_price) {
		this.a_direct_price = a_direct_price;
	}
	public String getA_regtime() {
		return a_regtime;
	}
	public void setA_regtime(String a_regtime) {
		this.a_regtime = a_regtime;
	}
	public String getA_selltime() {
		return a_selltime;
	}
	public void setA_selltime(String a_selltime) {
		this.a_selltime = a_selltime;
	}
	public String getA_sledding() {
		return a_sledding;
	}
	public void setA_sledding(String a_sledding) {
		this.a_sledding = a_sledding;
	}
	public int getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
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

	
	
	
}
