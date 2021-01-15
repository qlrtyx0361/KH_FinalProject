<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.bookmaker.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보 수정 페이지</title>
	<c:import url="../common/header.jsp"/>
	<style>
		div#update-container{width:400px; margin:0 auto; text-align:center;}
		div#update-container input, div#update-container select {margin-bottom:10px;}
	</style>
	</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
	<div id="update-container">
		<form name="memberUpdateFrm" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post">
			<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="memberId" id="memberId_" value="${member.memberId}" readonly required>
			<input type="text" class="form-control" placeholder="이름" name="name" id="name" value="${member.name}" required>
			<input type="text" class="form-control" placeholder="주소" name="address" value="${member.address}" id="address" required>
			<input type="tel" class="form-control" placeholder="(-없이)01012345678" name="tel"  value="${member.tel}" id="tel" maxlength="11"  required>
			<input type="email" class="form-control" placeholder="이메일" name="email" id="email" value="${member.email}"  required>
			<input type="birth" class="form-control" placeholder="탄생일" name="birth" id="birth" value="${member.birth}"  required>
			<input type="" class="form-control" placeholder="등급" name="gradeType" id="gradeType" value="${member.gradeType}" readonly required>
			<div class="form-check form-check-inline">
									 <input type="radio" name="emailIsok" value="ok" ${member.emailIsok=='ok'?'selected':'' }> 수신함&nbsp&nbsp;
   									 <input type="radio" name="emailIsok" value="no" ${member.emailIsok=='no'?'selected':'' }> 수신거절
								</div>
			
			<br />
			<input type="submit" class="btn btn-outline-success" value="수정" >&nbsp;
			<input type="reset" class="btn btn-outline-success" value="취소">&nbsp;
			<input type="button" class="btn btn-outline-success" onclick="location.href='${pageContext.request.contextPath}/member/memberDelete.do'" value="탈퇴">
		</form>
	</div>
	<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>