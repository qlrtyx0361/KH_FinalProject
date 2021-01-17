<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지 수정</title>
	<c:import url="../common/header.jsp"/>
</head>
<body>
	<header>
		<c:import url="../common/menubar.jsp"/>
	</header>
	
	<section class="container">
		<form id="noticeUpdateFrm" action="${pageContext.request.contextPath}/notice/noticeUpdate.do" method="post">
			<input type="hidden" name="noticeNo" value="${n.noticeNo}"/>
			<div class="row">
				<label class="col-2">제목</label>
				<input type="text" class="form-control col-10" placeholder="제목" name="noticeTitle" id="noticeTitle" value="${n.noticeTitle}" required/>
			</div>
			<div class="row">
				<label class="col-2">작성자</label>
				<input type="text" class="form-control col-4" name="memberId" value="${n.memberId}" readonly/>
				<label class="col-2">조회수</label>
				<input type="text" class="form-control col-4" name="noticeCount" value="${n.noticeCount}" readonly/>
			</div>
			<div class="row">
				<textarea name="noticeContent" class="col-12" cols="30" rows="10" style="resize:none;" required>${n.noticeContent}</textarea>
			</div>
			
			<br />
			
			<div class="row justify-content-md-center">
				<button type="button" id="btnSubmit" class="btn btn-primary col-3">수정 완료</button>&nbsp;
				<button type="button" class="btn btn-secondary col-3" onclick="history.go(-1); return false;">취소</button>
			</div>
			
			<br />
		</form>
	</section>
	
	<footer>
		<c:import url="../common/footer.jsp"/>
		
		<script>
			$('#btnSubmit').on('click', function() {
				$('#noticeUpdateFrm').submit();
			});
		</script>
	</footer>
</body>
</html>