package action;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// POJO(Plain Old Java Object) : 순수자바객체
public class CommandAction extends Object {

	// 목록요청 처리
	public String list(HttpServletRequest request, HttpServletResponse response) {
		
		List<String> list = new ArrayList<String>();
		
		list.add("Java");
		list.add("Oracle");
		list.add("Html");
		list.add("CSS");
		list.add("Javascript");
		list.add("Spring");
		
		// request binding
		request.setAttribute("list", list);
		
		return "list.jsp";
	}

	public String view(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// /view.do?book=Java
		// /view.do?book=Oracle
		String book = request.getParameter("book");
		String description = "";
		
		switch(book.toUpperCase()) {
		case "JAVA" : description="JAVA는 맛있는 언어입니다. 제임스 고슬링이 만들었으며, 전자제품 제어용언어로 만들었습니다."; break;
		case "ORACLE" : description="Oracle은 Java의 회사로써 구글과의 법정공방에서 승소했습니다. 현존하는 DBMS중에서 독보적인 성능을 갖는 데이터베이스 프로그램입니다."; break;
		case "HTML" : description="Html은 Markup Language로써, 하이퍼텍스트를 기반으로 만들어진 언어입니다."; break;
		case "CSS" : description="Cascading Style Sheet로 CSS는 하이퍼텍스트 기반으로 만들어진 Html을 보다 맛있게 디자인 해주는 언어입니다."; break;
		case "JAVASCRIPT" : description="Javascript는 Html을 보다 맛있게 반응형으로 동작할 수 있는 웹사이트로 만들어줍니다."; break;
		case "SPRING" : description="Spring은 Java 사용을 보다 수월하게 해주는 Java용 프레임워크 입니다."; break;
		default : description="얘에 대한 정보는 없는데~~..";
		}
		
		request.setAttribute("book", book);
		request.setAttribute("description", description);
		
		return "view.jsp";
	}
}
