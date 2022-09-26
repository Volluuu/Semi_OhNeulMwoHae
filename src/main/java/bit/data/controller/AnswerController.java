package bit.data.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import bit.data.dto.BoardAnswerDto;
import bit.data.service.BoardAnswerServiceInter;
import util.ChangeName;

@RestController
@RequestMapping("/answer")
public class AnswerController {

	@Autowired
	BoardAnswerServiceInter answerService;
	
	String uploadPhoto;
	
	//댓글에서 사진 업로드 시, 호출
	@PostMapping("/updatephoto")
	public Map<String, String> photoUpload(MultipartFile photo,HttpServletRequest request)
	{
		// Tom cat에 올라간upload 폴더 경로
		String path=request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(path);
		//저장할 파일명 구하기
		uploadPhoto=ChangeName.getChangeFileName(photo.getOriginalFilename());
		
		//upload
		
		try {
			photo.transferTo(new File(path+"/"+uploadPhoto));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("aphoto", uploadPhoto);
		
		return map;
	}
	
	@PostMapping("/insert")
	public void insert(BoardAnswerDto dto)
	{
		//사진만 따로 저장 후 db insert
		if(uploadPhoto==null)//사진 선택을 안했을경우
		{
			dto.setPhoto("no");
		}else {
			dto.setPhoto(uploadPhoto);
		}
		answerService.insertAnswer(dto);
		uploadPhoto=null;//그 다음 댓글을 위해서 사진이름은 null로 초기화
	}
	
	@GetMapping("/list")
	public List<BoardAnswerDto> list(int num)
	{
		return answerService.getAllAnswerList(num);
	}
	
	@GetMapping("/delete")
	public void delete(int idx, HttpServletRequest request)
	{
		//업로드 될 경로 구하기
		String path=request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(path);
		
		//데이터 삭제전에 사진지우기
		//사진명을 얻기
		String photo=answerService.getAnswer(idx).getPhoto();
		
		//File 객체 생성
		File file=new File(path+"/"+photo);
		if(file.exists()) {
			System.out.println("파일이 존재하므로 삭제합니다");
			file.delete();
		}
		 
		answerService.deleteAnswer(idx);
	}
	
	
}


















