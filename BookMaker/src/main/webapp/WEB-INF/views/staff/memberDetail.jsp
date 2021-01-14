<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보</title>
	<c:import url="../common/header.jsp"/>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div class="container">
		<h1>회원 정보 상세</h1>
		
		<table>
			<tr>
				<td>등급</td>
				<td>${ m.gradeName }</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${ m.memberId }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${ m.name }</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${ m.tel }</td>
			</tr>
			<tr>
				<td>Email</td>
				<td>${ m.email }</td>
			</tr>
			<tr>
				<td>Email 수신 여부</td>
				<td>${ m.emailIsOk }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${ m.address }</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${ m.birth }</td>
			</tr>
			<tr>
				<td>가입일</td>
				<td>${ m.joinDate }</td>
			</tr>
		</table>
	</div>
	
	<c:import url="../common/footer.jsp"/>
	
</body>
</html>