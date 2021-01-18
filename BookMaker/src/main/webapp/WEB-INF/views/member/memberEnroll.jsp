<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입 창</title>
	<c:import url="../common/header.jsp"/>
	<style>
		div#enroll-container{width:400px; margin:0 auto; text-align:center;}
		div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
		div#enroll-container table th{text-align: right; padding-right:10px;}
		div#enroll-container table td{text-align: left;}
		/*중복아이디체크관련*/
		div#userId-container{position:relative; padding:0px;}
		div#userId-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
		div#userId-container span.ok{color:green;}
		div#userId-container span.error, span.invalid{color:red;}
		td##enroll-container input, div#enroll-container select {margin-bottom:10px;}
		
		
		    <style>


body {
  background-image: #34495e;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}

.bottomText {
  text-align: center;
}
	</style>
</head>
<body>
<c:import url="../common/menubar.jsp"/><br /><br />
	<div id="container">
		
		<section id="content">
			<div id="enroll-container">
				<form name="memberEnrollFrm" action="memberEnrollEnd.do" method="post" onsubmit="return fn_enroll_validate();" >
					<table>
						<tr>
							<th>아이디</th>
							<td >
								<div id="userId-container">
									<input type="text" class="form-control" placeholder="4글자이상" name="memberId" id="memberId" required>
									<!-- 아이디중복검사 코멘트추가 -->
									<span class="guide ok">사용 가능</span>
				            		<span class="guide error">사용 불가</span>
				            		<span class="guide invalid">4글자 미만</span>
				            		<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
				            	</div>
							</td>
						</tr>
						<tr>
							<th>비번</th>
							<td >
								<input type="password" class="form-control" name="password" id="password" required>
							</td>
						</tr>
						<tr>
							<th>비번확&nbsp&nbsp인</th>
							<td>	
								<input type="password" class="form-control" id="password" required>
							</td>
						</tr>  
						<tr>
							<th>이름</th>
							<td >	
							<input type="text" class="form-control" name="name" id="name" required>
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>	
								<input type="text"  class="form-control" name="address" id="address" >
   									<p>*주소는 (시/도)만 입력해주세요 (예: 경기도, 서울특별시, 경상남도 등)</p>
							</td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td>	
								<input type="tel" class="form-control" placeholder="(-없이)01012345678" name="tel" id="tel" maxlength="11" required>
							</td>
						</tr>
						
						<tr>
							<th>이메일</th>
							<td>	
								<input type="email" class="form-control" placeholder="abc@xyz.com" name="email" id="email">
							</td>
						</tr>
						<tr>
							<th>탄생일</th>
							<td>	
								 <select name="birthDay" id="birth1">
							           <option value="2013">2013</option>
							           <option value="2012">2012</option>
							           <option value="2011">2011</option>
							           <option value="2010">2010</option>
							           <option value="2009">2009</option>
							           <option value="2008">2008</option>
							           <option value="2007">2007</option>
							           <option value="2006">2006</option>
							           <option value="2005">2005</option>
							           <option value="2004">2004</option>
							           <option value="2003">2003</option>
							           <option value="2002">2002</option>
							           <option value="2001">2001</option>
							           <option value="2000">2000</option>
							         </select>년
							         <select name="birthDay" id="birth2">
							           <option value="01">1</option>
							           <option value="02">2</option>
							           <option value="03">3</option>
							           <option value="04">4</option>
							           <option value="05">5</option>
							           <option value="06">6</option>
							           <option value="07">7</option>
							           <option value="08">8</option>
							           <option value="09">9</option>
							           <option value="10">10</option>
							           <option value="11">11</option>
							           <option value="12">12</option>
							         </select>월
							         <select name="birthDay" id="birth3">
							           <option value="01">1</option>
							           <option value="02">2</option>
							           <option value="03">3</option>
							           <option value="04">4</option>
							           <option value="05">5</option>
							           <option value="06">6</option>
							           <option value="07">7</option>
							           <option value="08">8</option>
							           <option value="09">9</option>
							           <option value="10">10</option>
							           <option value="11">11</option>
							           <option value="12">12</option>
							           <option value="13">13</option>
							           <option value="14">14</option>
							           <option value="15">15</option>
							           <option value="16">16</option>
							           <option value="17">17</option>
							           <option value="18">18</option>
							           <option value="19">19</option>
							           <option value="20">20</option>
							           <option value="21">21</option>
							           <option value="22">22</option>
							           <option value="23">23</option>
							           <option value="24">24</option>
							           <option value="25">25</option>
							           <option value="26">26</option>
							           <option value="27">27</option>
							           <option value="28">28</option>
							           <option value="29">29</option>
							           <option value="30">30</option>
							           <option value="31">31</option>
							         </select>일
							</td>
						</tr>
						
						<tr>
							<th><br />이메일수신 </th>
							<br />
							<td>&nbsp&nbsp&nbsp;
								<div class="form-check form-check-inline">
									 <input type="radio" name="emailIsok" value="ok"> 수신함&nbsp&nbsp;
   									 <input type="radio" name="emailIsok" value="no"> 수신거절
								</div>
							</td>
						</tr>
						
					</table>
					<input type="submit" class="btn btn-outline-success" value="가입" >
					  <input type="reset"  class="btn btn-outline-success" value="다시입력">
				
				</form>
			</div>
		</section>
		<br /><br />
		<c:import url="../common/footer.jsp"/>
		<script>
			$(function(){
				
				$("#password2").blur(function(){
					var p1=$("#password_").val(), p2=$("#password2").val();
					if(p1!=p2){
						alert("패스워드가 일치하지 않습니다.");
						$("#password_").focus();
					}
				});
				
				/* 아이디 중복검사 이벤트 추가 */
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
				                //에러로그
				                console.log(jqxhr);
				                console.log(textStatus);
				                console.log(errorThrown);
				            }
			        	});
			     	}
			     //console.log(userId);
				});
			});
			
			function validate(){
				var userId = $("#userId_");
				if(userId.val().trim().length<4){
					alert("아이디는 최소 4자리이상이어야 합니다.");
					userId.focus();
					return false;
				}
				
				//아이디중복체크여부
			    if($("#idDuplicateCheck").val()==0){
			        alert("사용가능한 아이디를 입력해주세요.");
			        return false();
			    }
				
				return true;
			}
			</script>
	</div>
</body>
</html>