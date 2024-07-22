package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vo.PhotoVo;

// Servlet에서 만들어진다.
@Controller
public class FileUploadController {
	
	// Dispatcher Injection(주입)시켜준다
	
	@Autowired
	ServletContext application;
	
	
	// /upload1.do?title=제목&photo=a.jpg
	// 일부러 RequestParam을 sajin으로 명시했을 경우
	// @RequestParam(name="photo") MultipartFile photo <= 이름이 동일하면 name="photo" 생략가능
	@RequestMapping("/upload1.do")
	public String upload1(String title, 
						@RequestParam(name="photo") MultipartFile photo,
						Model model) throws Exception {
		
		// 웹경로
		String webPath = "/resources/images/";
		// 절대경로(위에 webPath의 절대경로가 어디냐)
		String absPath = application.getRealPath(webPath);
		
		System.out.println(absPath);
		
		String filename="no_file";
		if(!photo.isEmpty()) {
			// 업로드된 파일명을 구한다.
			filename = photo.getOriginalFilename();
			
			// 저장 경로 및 파일
			File f = new File(absPath,filename);
			
			if(f.exists()) { // 동일 화일이 존재하냐?
				
				// 시간_파일명 이름변경
				long tm = System.currentTimeMillis();
				filename = String.format("%d_%s", tm, filename);
				
				f = new File(absPath,filename);
			}
			
			// spring이 저장해놓은 임시 파일을 복사해온다.
			photo.transferTo(f);
		}
		
		// 결과적으로 request binding
		model.addAttribute("title",title);
		model.addAttribute("filename",filename);
		
		
		return "result1";
	}
	
	
	
	
	// /upload1.do?title=제목&photo=a.jpg
	// 일부러 RequestParam을 sajin으로 명시했을 경우
	// @RequestParam(name="photo") MultipartFile photo <= 이름이 동일하면 name="photo" 생략가능
	@RequestMapping("/upload2.do")
	public String upload2(PhotoVo vo, Model model) throws Exception {
		
		// 이 방법은 받는거 자체는 쉬운데, 메모리낭비가 심해진다 (계속 가지고 있기 때문이다)
		
		// 웹경로
		String webPath = "/resources/images/";
		// 절대경로(위에 webPath의 절대경로가 어디냐)
		String absPath = application.getRealPath(webPath);
		
		System.out.println(absPath);
		
		String filename="no_file";
		
		MultipartFile photo = vo.getPhoto();
		
		if(!photo.isEmpty()) {
			// 업로드된 파일명을 구한다.
			filename = photo.getOriginalFilename();
			
			// 저장 경로 및 파일
			File f = new File(absPath,filename);
			
			if(f.exists()) { // 동일 화일이 존재하냐?
				
				// 시간_파일명 이름변경
				long tm = System.currentTimeMillis();
				filename = String.format("%d_%s", tm, filename);
				
				f = new File(absPath,filename);
			}
			
			// spring이 저장해놓은 임시 파일을 복사해온다.
			photo.transferTo(f);
		}
		
		vo.setFilename(filename);
		
		model.addAttribute("vo",vo);
		
		return "result2";
	}
	
	
	
	
	
	
	
	
	
	
}