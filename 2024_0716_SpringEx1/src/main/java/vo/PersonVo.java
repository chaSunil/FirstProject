package vo;

public class PersonVo {

	String name;
	int age;
	String addr;
	
	public PersonVo(String name, int age, String addr) {
		super();
		System.out.println("Constructor Injection으로 주고 있다구");
		// System.out.println("--PersonVo(name,age,addr)-- Constructor Injection이 소환이 완료가 되었습니다.");
		this.name = name;
		this.age = age;
		this.addr = addr;
	}
	
	public PersonVo() {
		System.out.println("Setter Injection으로 주고 있다구");
		// TODO Auto-generated constructor stub
		// System.out.println("--PersonVo()-- 기본 생성자로 소환이 완료가 되었습니다.");
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		// System.out.println("setName이 소환이 완료가 되었습니다.");
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
}
