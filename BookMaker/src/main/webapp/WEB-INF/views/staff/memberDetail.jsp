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
	<header>
		<c:import url="../common/menubar.jsp"/>
	</header>
	
	<section class="container">
		<div>
			<h1>회원 정보 상세</h1>
			
			<div class="row">
				<label class="col-2">아이디</label>
				<input type="text" class="form-control col-6" name="memberId" value="${m.memberId}" readonly/>
			</div>
			<div class="row">
				<label class="col-2">이름</label>
				<input type="text" class="form-control col-6" name="name" value="${m.name}" readonly/>
			</div>
			<div class="row">
				<label class="col-2">생년월일</label>
				<input type="text" class="form-control col-6" name="birth" value="${m.birth}" readonly/>
			</div>
			<div class="row">
				<label class="col-2">전화번호</label>
				<input type="text" class="form-control col-6" name="tel" value="${m.tel}" readonly/>
			</div>
			<div class="row">
				<label class="col-2">Email</label>
				<input type="text" class="form-control col-6" name="email" value="${m.email}" readonly/>
			</div>
			<div class="row">
				<label class="col-2">Email 수신 여부</label>
				<div class="col-2">
					<input type="radio" name="emailIsok" id="emailOk" value="ok" disabled/> 예
				</div>
				<div class="col-2">
					<input type="radio" name="emailIsok" id="emailNo" value="no" disabled/> 아니오
				</div>
			</div>
			<div class="row">
				<label class="col-2">주소</label>
				<input type="text" class="form-control col-6" name="address" value="${m.address}" readonly/>
			</div>
			<div class="row">
				<label class="col-2">회원 등급</label>
				<input type="text" class="form-control col-6" name="memberType" value="${m.memberType}" readonly/>
			</div>
			<div class="row">
				<label class="col-2">멤버십 등급</label>
				<input type="text" class="form-control col-6" name="gradeName" value="${m.gradeName}" readonly/>
			</div>
			<div class="row">
				<label class="col-2">가입일</label>
				<input type="text" class="form-control col-6" name="joinDate" value="${m.joinDate}" readonly/>
			</div>
			<br />
		</div>
	</section>
	
	<footer>
		<c:import url="../common/footer.jsp"/>
		
		<script>
			$(function() {
				if('${m.emailIsok}' == 'ok') {
					$('#emailOk').prop('checked', true);
				} else {
					$('#emailNo').prop('checked', true);
				}
			});
		</script>
	</footer>
	
</body>
</html>