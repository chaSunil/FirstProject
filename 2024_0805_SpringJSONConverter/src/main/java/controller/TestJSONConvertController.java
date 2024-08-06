package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;import java.util.function.ObjDoubleConsumer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import vo.PersonVo;

@Controller
public class TestJSONConvertController {

	
	@RequestMapping("/map_to_json.do")
	@ResponseBody // 그대로 String으로 반환(view X)
	public Map<String, Object> map_to_json() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("name", "홍길동");
		map.put("age", 20);
		map.put("addr", "서울시 관악구 남부순환로 111");
		
		return map;
	}
	
	
	@RequestMapping("/object_to_json.do")
	@ResponseBody // 그대로 String으로 반환(view X)
	public PersonVo object_to_json() {
	
		PersonVo p = new PersonVo("홍길동",20,"서울시 관악구 봉천동");
		
		return p;
	}
	
	
	@RequestMapping("/list_to_json.do")
	@ResponseBody // 그대로 String으로 반환(view X)
	public List<String> list_to_json() {
		
		List<String> sido_list = new ArrayList<String>();
		
		sido_list.add("서울");
		sido_list.add("경기");
		sido_list.add("인천");
		sido_list.add("강원");
		sido_list.add("제주");
		
		return sido_list;
	}
	
	
	@RequestMapping("/person_list_to_json.do")
	@ResponseBody // 그대로 String으로 반환(view X)
	public List<PersonVo> person_list_to_json() {
		
		List<PersonVo> list = new ArrayList<PersonVo>();
		
		list.add(new PersonVo("일길동",21,"서울시 강남구 신사1동"));
		list.add(new PersonVo("이길동",22,"서울시 강남구 신사2동"));
		list.add(new PersonVo("삼길동",33,"서울시 강남구 신사3동"));
		list.add(new PersonVo("사길동",44,"서울시 강남구 신사4동"));
		list.add(new PersonVo("오길동",55,"서울시 강남구 신사5동"));
		
		return list;
	}
	
	
	@RequestMapping("/person_map_to_json.do")
	@ResponseBody // 그대로 String으로 반환(view X)
	public Map<String, Object> person_map_to_json() {
		
		List<PersonVo> list = new ArrayList<PersonVo>();
		
		list.add(new PersonVo("일길동",21,"서울시 강남구 신사1동"));
		list.add(new PersonVo("이길동",22,"서울시 강남구 신사2동"));
		list.add(new PersonVo("삼길동",33,"서울시 강남구 신사3동"));
		list.add(new PersonVo("사길동",44,"서울시 강남구 신사4동"));
		list.add(new PersonVo("오길동",55,"서울시 강남구 신사5동"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("size", list.size());
		map.put("search_date", new Date().toString()); // 검색한 시간
		map.put("data", list);
		
		return map;
	}
	
}
