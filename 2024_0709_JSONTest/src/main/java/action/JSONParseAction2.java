package action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import json.vo.PersonVo;

/**
 * Servlet implementation class JSONParseAction2
 */
@WebServlet("/json_parse2.do")
public class JSONParseAction2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// json으로 받아올 데이터를 담을 list를 생성하기
		List<PersonVo> p_list = new ArrayList<PersonVo>();
		try {
			String str_url = "http://localhost:8080/2024_0709_JSONTest/person.jsp";
			URL url = new URL(str_url);
			// 이용하는 이유 : 요청시 헤더 정보 전달(인증키)
			// 커넥션은 서버와 클라이언트가 연결될 수 있게 하는 하나의 공간
			URLConnection urlConn = url.openConnection();
			
			InputStream is = urlConn.getInputStream();
			
			// json을 라인 단위로 읽어온다. 인풋스트림 리더로 인코딩을 utf-8로 읽어온다.
			// 그것을 br로 라인 단위로 읽어오면, 훨씬 빠르게 읽을 수 있다.
			BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));
			
			// BufferedReader를 담을 StringBuilder를 만든다.
			StringBuilder sb = new StringBuilder();
			
			while(true) {
				// line 단위로 읽어온다.
				String data = br.readLine();
				if(data==null) break;
				
				sb.append(data+"\n");
			}
			// StringBuilder에 들어가있는 json 데이터를 json에 넣는다.
			JSONObject json = new JSONObject(sb.toString());
			// list에 담겨있는 배열을 저장한다. [0,1,2]
			JSONArray personArray = json.getJSONArray("list");
			
			for(int i = 0; i<personArray.length(); i++) {
				JSONObject person = personArray.getJSONObject(i);
				// person = {"name":"홍길동","age":31,"tel":"010-111-1234"}
				String name = person.getString("name");
				int age = person.getInt("age");
				String tel = person.getString("tel");
				
				PersonVo vo = new PersonVo(name, age, tel);
				p_list.add(vo);
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		// request binding
		request.setAttribute("p_list", p_list);
		
		// Dispatcher형식으로 호출
		String forward_page = "result_json2.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}