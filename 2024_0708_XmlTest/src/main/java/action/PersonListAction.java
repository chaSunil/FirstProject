package action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import xml.vo.PersonVo;

/**
 * Servlet implementation class PersonListAction
 */
@WebServlet("/person/list.do")
public class PersonListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<PersonVo> p_list = new ArrayList<PersonVo>();
		
		// XML Parser : SAXBuilder
		SAXBuilder builder = new SAXBuilder();
		
		// web 경로 -> 절대경로
		String absPath = request.getServletContext().getRealPath("/");
		File f = new File(absPath, "person.xml");
		
		try {
			// XML의 문서정보 읽어오기
			Document doc = builder.build(f);
			// XML내의 RootElement 얻어오기
			Element root = doc.getRootElement();
			// root element 밑의 자식 Element 구하기
			List<Element> person_list = root.getChildren("person");
			
			for(Element person : person_list) {
				String name = person.getChildText("name");
				String nickname = person.getChild("name").getAttributeValue("nickname");
				
				int age = 0;
				// 혹시 age에서 parseInt 할 때 값이 없으면 오류 발생
				try {
					age = Integer.parseInt(person.getChildText("age"));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					// e.printStackTrace();
				}
				
				String tel = person.getChildText("tel");
				String hometel = person.getChild("tel").getAttributeValue("hometel");
				
				// VO 포장
				PersonVo vo = new PersonVo(name, nickname, age, tel, hometel);
				
				// ArrayList에 추가
				p_list.add(vo);
			}// end:for
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// request binding : 구체적인 값을 변수로 할당(binding)
		request.setAttribute("p_list", p_list);
		

		// Dispatcher형식으로 호출
		String forward_page = "person_list.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}