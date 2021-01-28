# Final Project

### KH정보교육원 수료 ###
### 작성자 : 이진솔 ###
### 교육기간 2020년 07월 16일 ~ 2021년 01월 18일 ### 


</br></br>
# 온라인 도서 사이트 개발 #

  * 기획의도
    * 언택트시대에 온라인도서의 비중이 늘면서 
      기존의 방식보다 효율적인 도서판매사이트를        
      만들고자 함.
      
   ![SWOT 분석](https://github.com/qlrtyx0361/KH_FinalProject/blob/master/SWAT.PNG)



# ![개발일정](https://github.com/qlrtyx0361/KH_FinalProject/blob/master/DATE.PNG)
</br></br>

# Tech Stack #
![](https://github.com/qlrtyx0361/KH_FinalProject/blob/master/tool.PNG)
</br>
### - 사용 언어 : JAVA, JavaScript, Ajax
### - 툴 : Spring, Oracle, SQLDeveloper
### - 서버 : apache Tomcat , JSP
### - 홈페이지는 HTML기반이며 디자인은 css
### - 라이브러리 : Jquery, myBaits, Maven
### - 형상관리 : github
</br></br>

# ERD_DB #

![ERD1](https://user-images.githubusercontent.com/73675217/105877437-57f9dc00-6043-11eb-9dc8-f8331436273f.png)

![image](https://user-images.githubusercontent.com/73675217/105878696-a65baa80-6044-11eb-9ad6-fbd72b4cf7cc.png)

![image](https://user-images.githubusercontent.com/73675217/105878862-d4d98580-6044-11eb-8dd4-65642272b21b.png)

![image](https://user-images.githubusercontent.com/73675217/105878912-e4f16500-6044-11eb-9b5d-b93f705b8597.png)





</br></br>
## 회원가입 작성 시연입니다.

![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/73675217/105887250-d14afc00-604e-11eb-84aa-6526ba8428db.gif)

#



	//블로우피쉬 암호문 사용
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member member, Model model,
			@RequestParam("birthDay") String[] birthDay){

		Date birth = Date.valueOf(String.join("-", birthDay));
		member.setBirth(birth);
		
		
		String plainPassword = member.getPassword();

		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);

		System.out.println("원문 : " + plainPassword);
		System.out.println("암호문 : " + encryptPassword);

		member.setPassword(encryptPassword);

</br>




	//아이디 중복검사 이벤트 추가 
	$("#memberId").on("keyup", function(){
			        var userId = $(this).val().trim();
			        
			        if(userId.length<4) {
			        	$(".guide.error").hide();
			        	$(".guide.ok").hide();
			        	$(".guide.invalid").show();
			        	return;
			        	
			        } else {
			        	
				        $.ajax({
				            url  : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
				            data : {memberId:userId},
				            dataType: "json",
				            success : function(data){
				                console.log(data);
				                // if(data=="true") //stream 방식
				                if(data.isUsable==true){ //viewName 방식
				                    $(".guide.error").hide();
				                    $(".guide.invalid").hide();
				                    $(".guide.ok").show();
				                    $("#idDuplicateCheck").val(1);
				                } else {
				                    $(".guide.error").show();
				                    $(".guide.invalid").hide();
				                    $(".guide.ok").hide();
				                    $("#idDuplicateCheck").val(0);
				                }
				            }, error : function(jqxhr, textStatus, errorThrown){
				                console.log("ajax 처리 실패");




</br></br>
## 도서 등록 작성 시연입니다.

![ezgif com-gif-maker](https://user-images.githubusercontent.com/73675217/105887293-e1fb7200-604e-11eb-97f4-7a4018ac411d.gif)

#

</br></br>
## 문의 게시판 시연입니다.

![inquiry](https://user-images.githubusercontent.com/73675217/105887305-e6c02600-604e-11eb-8c3b-e1f4fe40f9c1.gif)

#


   		// MultipartFile 로 파일 업로드 처리하기 
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


</br></br>
## My Page 시연입니다.

![mypage](https://user-images.githubusercontent.com/73675217/105887314-eaec4380-604e-11eb-9843-1f94796bb1b9.gif)

#


        // 게시글 페이지 설정 ( mypage-mapper.xml )
 	<select id="selectmypageList" resultType="Inquiry">
		SELECT A.*, 
		(SELECT COUNT(*) FROM INQUIRYFILE WHERE INQUIRYNO = A.INQUIRYNO) FILECOUNT
		FROM INQUIRY A
		WHERE MEMBERID = #{memberId}
		ORDER BY UPLOADDATE DESC, INQUIRYNO DESC



</br></br>
## 수정, 삭제 시연입니다.

![inquiry](https://user-images.githubusercontent.com/73675217/105887305-e6c02600-604e-11eb-8c3b-e1f4fe40f9c1.gif)

#








</br></br></br></br></br></br></br></br></br></br>

# 이상입니다.

![ezgif com-gif-maker](https://user-images.githubusercontent.com/73675217/106155320-e2694980-61c3-11eb-9117-0a9afad65e5b.gif)

#


