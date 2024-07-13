package util;

import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;

import xml.vo.ProductVo;

public class MySearchUtil2 {
	
	// 객체 생성 없이 바로 사용 가능
	public static List<ProductVo> search_shop2(String p_name, int start, int display){
		// 값을 저장해줄 ArrayList 생성
		List<ProductVo> list = new ArrayList<ProductVo>();
		String clientId = "HSnvoxqFuNlT20cUc6Bv";
		String clientSecret = "2XBVa64aOh";
		
		try {
			// p_name은 한글이기 때문에 인코딩이 필요하다.
			p_name = URLEncoder.encode(p_name, "utf-8");
			// url을 변수에 저장한다.
			String urlStr = String.format("https://openapi.naver.com/v1/search/shop.xml?query=%s&start=%d&display=%d",
					p_name, start, display);
			// url을 객체로 생성한다.
			URL url = new URL(urlStr);
			// url에 커넥션을 가져온다. / 커넥션은 서버와 클라이언트가 연결되어 통신할 수 있는 하나의 장소
			HttpsURLConnection connection = (HttpsURLConnection)url.openConnection();
			// 발급받은 ID
			connection.setRequestProperty("X-Naver-Client-Id", clientId);
			// 발급받은 PW
			connection.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			// 받을 요청 타입
			connection.setRequestProperty("Content-Type", "application/xml");
			connection.connect();
			
			// 여기까지의 과정은 url의 xml을 커넥션을 통해서 받아오는 과정이다.
			
			
			// SAXBuilder는 xml을 파싱하기 위해서 도와주는 도구이다.
			SAXBuilder builder = new SAXBuilder();
			// 삭스빌더의 빌드 메서드를 통해 Document를 만들어준다.
			Document   doc = builder.build (connection.getInputStream());
			// 위에 doc은 xml문서 전체를 지칭한다. root는 시작 엘리먼트 태그
			Element root = doc.getRootElement();
			// 루트 아래에 있는 채널 안에 있는 아이템의 자식 엘리먼트들을 가져온다.
			List<Element> item_list = root.getChild("channel").getChildren("item");
			
			int no = start;
			// 아이템의 자식 엘리먼트를 반복문을 통해서 ArrayList에 담는다.
			for(Element item : item_list) {
				String title = item.getChildText("title");
				String link = item.getChildText("link");
				String image = item.getChildText("image");
				int lprice=0,hprice=0;
				
				try {
					lprice = Integer.parseInt(item.getChildText("lprice"));
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				try {
					hprice = Integer.parseInt(item.getChildText("hprice"));
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				String mallName = item.getChildText("mallName");
				
				// item의 자식 엘리먼트들을 vo에 담는다.
				ProductVo vo = new ProductVo();
				vo.setNo(no++);
				vo.setTitle(title);
				vo.setLink(link);
				vo.setImage(image);
				vo.setLprice(lprice);
				vo.setHprice(hprice);
				vo.setMallName(mallName);
				
				// ArrayList에 담기
				list.add(vo);
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}

}
