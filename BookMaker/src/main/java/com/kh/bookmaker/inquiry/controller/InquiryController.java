package com.kh.bookmaker.inquiry.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bookmaker.common.util.Utils;
import com.kh.bookmaker.inquiry.model.service.InquiryService;
import com.kh.bookmaker.inquiry.model.vo.Inquiry;
import com.kh.bookmaker.inquiry.model.vo.InquiryAnswer;
import com.kh.bookmaker.inquiry.model.vo.InquiryFile;
import com.kh.bookmaker.inquiry.model.vo.InquiryAnswerFile;

@Controller
public class InquiryController {

	@Autowired
	InquiryService inquiryService;
	
	@RequestMapping("/inquiry/inquiryList.do")
	public String selectInquiryList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
		
		
		List<Map<String, String>> list = inquiryService.selectInquiryList(cPage, numPerPage);
		
		
		int totalContents = inquiryService.selectInquiryTotalContents();
		

		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "inquiryList.do");
		
		System.out.println("list : " + list);
		
		/* model.addAttribute("inquiryAnswerNo",inquiryAnswerNo); */
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "inquiry/inquiryList";
	
	}
	
	@RequestMapping("/inquiry/inquiryForm.do")
	public void inquiryForm() {
	
	}
	
	@RequestMapping("/inquiry/inquiryFormEnd.do")
	public String insertInquiry(Inquiry inquiry, Model model, HttpServletRequest req,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles) {
		

		
		// 1. 파일 저장 경로와 파일 정보를 담을 객체 생성
		String saveDirectory
		      = req.getServletContext().getRealPath("/resources/inquiryUpload");
		List<InquiryFile> inquiryFile = new ArrayList<InquiryFile>();
		
		/*** MultipartFile 로 파일 업로드 처리하기 ***/
		for(MultipartFile f : upFiles) {
			if( f.isEmpty() == false ) { 
				// 파일이 비어있지 않다면 --> 첨부파일을 추가했다면 다음을 실행해라
				
				// 2. 파일명 재생성
				String originName = f.getOriginalFilename();
				String changeName = fileNameChanger(originName);
				
				try {
					f.transferTo(new File(saveDirectory + "/" + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				// 3. list에 담기
				InquiryFile at = new InquiryFile();
				at.setInquiryFilename(originName);
				at.setRenameFilename(changeName);
				
				inquiryFile.add(at);
			}
		}		
		/*********************************************/
		
		// 4. 비즈니스(서비스) 로직 수행
		System.out.println(inquiry);
		int result = inquiryService.insertInquiry(inquiry, inquiryFile);
		
		// 5. 처리 결과에 따른 view 처리
		String loc = "/inquiry/inquiryList.do";
		String msg = "";
		if( result > 0 ) {
			msg = "게시글 등록 성공";
		} else {
			msg = "게시글 등록 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	

		
		
		@RequestMapping("/inquiry/inquiryView.do")
		public String inquiryView(@RequestParam int no, Model model) {
			
			Inquiry inquiry = inquiryService.selectOneInquiry(no);
			
			 List<InquiryFile> inquiryFileList = inquiryService.selectinquiryfileList(no);
			 
			
			model.addAttribute("inquiry", inquiry);
			model.addAttribute("inquiryFileList", inquiryFileList); 
					
			
			return "inquiry/inquiryView";
		}
		
		@RequestMapping("/inquiry/fileDownload.do")
		public void fileDownload(@RequestParam String oName,
								   @RequestParam String rName,
								   HttpServletRequest request,
								   HttpServletResponse response){
			
			//파일저장디렉토리
			String saveDirectory = request.getServletContext().getRealPath("/resources/inquiryUpload");	
		
			BufferedInputStream bis = null;
			ServletOutputStream sos = null;
				 
			try {
				sos = response.getOutputStream();
				File savedFile = new File(saveDirectory + "/" + rName);
				response.setContentType("application/octet-stream; charset=utf-8");

				// 한글 파일 명 처리 : 브라우져에 따른 인코딩 처리 선택
				String resFilename = "";
				boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1 
							  || request.getHeader("user-agent").indexOf("Trident") != -1;
				System.out.println("isMSIE="+isMSIE);
				if(isMSIE){
					// ie는 utf-8 인코딩을 명시적으로 선언 해줘야 한다. 
					// 또한 공백을 의미하는 ' '기호가 +로 변하기 때문에, 이를 %20로 치환해준다.
					// 그럼 진짜 '+'기호는...?? ==> '+'기호는 그에 맞는 유니코드로 치환되기 때문에 상관 X
					resFilename = URLEncoder.encode(oName, "UTF-8");
					System.out.println("ie : "+resFilename); //ie : %eb%82%98%eb%8a%94+%ec%a0%84%ec%84%a4%ec%9d%b4%eb%8b%a4.txt
										
					resFilename = resFilename.replaceAll("\\+", "%20");
					System.out.println("ie : "+resFilename); //ie : %eb%82%98%eb%8a%94%20%ec%a0%84%ec%84%a4%ec%9d%b4%eb%8b%a4.txt
				} else {
					// 다른 웹 브라우저 중 ISO-8859-1(EUC-KR)로 되어 있는 경우 인코딩 진행
					resFilename = new String(oName.getBytes("UTF-8"),"ISO-8859-1");
					System.out.println("not ie : "+resFilename);
					
				}
				response.addHeader("Content-Disposition",
						"attachment; filename=\"" + resFilename + "\"");

				//파일크기지정
				response.setContentLength((int)savedFile.length());

				FileInputStream fis = new FileInputStream(savedFile);
				bis = new BufferedInputStream(fis);
				int read = 0;

				while ((read = bis.read()) != -1) {
					sos.write(read);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				
				try {
					sos.close();
					bis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}

		}
		
		
		@RequestMapping("/inquiry/inquiryUpdateView.do")
		public String inquiryUpdateView(@RequestParam int inquiryNo, Model model) {
			
			Inquiry inquiry = inquiryService.updateView(inquiryNo);
			List<InquiryFile> inquiryFileList = inquiryService.selectinquiryfileList(inquiryNo);
			
			model.addAttribute("inquiry", inquiry);
			model.addAttribute("inquiryFileList", inquiryFileList);
			
			return "inquiry/inquiryUpdateView";
		}
		
		@RequestMapping("/inquiry/inquiryUpdate.do")
		public String inquiryUpdate(Inquiry inquiry,
							@RequestParam(value="upFile", required=false) MultipartFile[] upFiles,
							HttpServletRequest req, Model model) {
			
			int inquiryNo = inquiry.getInquiryNo();
			
			// 원본 게시글 불러와 수정하기
			Inquiry originInquiry = inquiryService.updateView(inquiryNo);
			System.out.println("originInquiry: " + originInquiry);
			
			originInquiry.setInquiryTitle(inquiry.getInquiryTitle());
			originInquiry.setInquiryContent(inquiry.getInquiryContent());
			
			// 1. 파일 저장 경로 선언
			String saveDirectory = req.getServletContext().getRealPath("/resources/inquiryUpload");
			
			// 원본 첨부파일 목록
			List<InquiryFile> inqFileList = inquiryService.selectinquiryfileList(inquiryNo);
			if( inqFileList == null ) inqFileList = new ArrayList<InquiryFile>();
			
			// 2. 변경한 파일 정보 업로드 시작!
			int idx = 0;
			for(MultipartFile f : upFiles) {
				InquiryFile at = null;
				
				if( f.isEmpty() == false ) {
					// 원본 파일 삭제
					if( inqFileList.size() > idx) {
						boolean fileDelete
						   = new File(saveDirectory +"/" + inqFileList.get(idx).getRenameFilename()).delete();
						
						System.out.println("파일 삭제 여부 확인 : " + fileDelete);
						
						at = inqFileList.get(idx);
					} else {
						at = new InquiryFile();
						at.setInquiryNo(inquiryNo);
						
						inqFileList.add(at);
					}
					
					// 파일 이름 변경하기
					String originName = f.getOriginalFilename();
					String changeName = fileNameChanger(originName);
					
					// 실제 파일 저장
					try {
						f.transferTo(new File(saveDirectory + "/" + changeName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					
					at.setInquiryFilename(originName);
					at.setRenameFilename(changeName);
					
					inqFileList.set(idx, at);
				}
				idx++;	
			}
			
			// 3. update 서비스 실행
			int result = inquiryService.updateInquiry(originInquiry, inqFileList);
			String loc = "/inquiry/inquiryList.do";
			String msg = "";
			
			if( result > 0 ) {
				msg = "게시글 수정 성공!";
			} else {
				msg = "게시글 수정 실패!";
			}
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
			
			return "common/msg";
		}
		
		@RequestMapping("/inquiry/inquiryDelete.do")
		public String inquiryDelete(@RequestParam int inquiryNo, 
				                  HttpServletRequest req, Model model) {
			
			// 1. 파일이 저장된 폴더 경로
			String saveDir = req.getServletContext().getRealPath("/resources/inquiryUpload");
			
			// 첨부파일 삭제 명단
			List<InquiryFile> delList = inquiryService.selectinquiryfileList(inquiryNo);
			
			// 2. DB 정보 삭제하기
			int result = inquiryService.deleteInquiry(inquiryNo);
			
			String loc = "/inquiry/inquiryList.do";
			String msg = "";
			
			if ( result > 0 ) {
				msg = "게시글 삭제 완료!";
				
				// 3. 실제 파일 지우기
				for(InquiryFile a : delList) {
					new File(saveDir + "/" + a.getRenameFilename()).delete();
				}
				
			} else {
				msg = "게시글 삭제 실패!";
			}
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
			
			return "common/msg";
		}
		
		@RequestMapping("/inquiry/inquiryAnswer.do")
		public void inquiryAnswer() {
			
			
		}
		
		
		
		/* -----------------문의게시글 답변 -------------*/
		
		@RequestMapping("/inquiry/inquiryAnswerok.do")
		public String inquiryAnswerok(InquiryAnswer inquiryAnswer, Model model, HttpServletRequest req,
				@RequestParam(value="upFile", required=false) MultipartFile[] upFiles) {
				
			System.out.println("asdf : " + inquiryAnswer);
			
			
			String saveDirectory
		      = req.getServletContext().getRealPath("/resources/inquiryUpload");
		List<InquiryAnswerFile> inquiryAnswerFile = new ArrayList<InquiryAnswerFile>();
		
		/*** MultipartFile 로 파일 업로드 처리하기 ***/
		for(MultipartFile f : upFiles) {
			if( f.isEmpty() == false ) { 
				// 파일이 비어있지 않다면 --> 첨부파일을 추가했다면 다음을 실행해라
				
				// 2. 파일명 재생성
				String originName = f.getOriginalFilename();
				String changeName = fileNameChanger(originName);
				
				try {
					f.transferTo(new File(saveDirectory + "/" + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				// 3. list에 담기
				InquiryAnswerFile at = new InquiryAnswerFile();
				at.setInquiryFilename(originName);
				at.setRenameFilename(changeName);
				
				inquiryAnswerFile.add(at);
			}
		}		
		/*********************************************/
		
		// 4. 비즈니스(서비스) 로직 수행
		
		int result = inquiryService.inquiryAnswerok(inquiryAnswer, inquiryAnswerFile);
		
		// 5. 처리 결과에 따른 view 처리
		String loc = "/inquiry/inquiryList.do";
		String msg = "";
		if( result > 0 ) {
			msg = "답변 등록 성공";
		} else {
			msg = "답변 등록 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
		
		
		@RequestMapping("/inquiry/answerView.do")
		public String answerView(@RequestParam int inquiryNo, Model model) {
			
			System.out.println("넘어옵니다@@@@@@@@@@@@");
			
			InquiryAnswer inquiryAnswer = inquiryService.answerView(inquiryNo);
			
			
			/*
			 * List<InquiryAnswerFile> inquiryAnswerFileList =
			 * inquiryService.answerViewfile(inquiryAnswerNo);
			 */
			 
			 
			
			model.addAttribute("inquiryAnswer", inquiryAnswer);
			/* model.addAttribute("inquiryFileList", inquiryFileList); */
					
			
			return "inquiry/answerView";
		}
		
		
	
	

		
		
		

			
			
			
			
		


// 단순 파일 이름 변경용 메소드 
public String fileNameChanger(String oldFileName) {

	String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
	int rnd = (int)(Math.random() * 1000);

	return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
	
}
		
		
	
}



