<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지 등록</title>
	<c:import url="../common/header.jsp"/>
</head>
<body>
	<header>
		<c:import url="../common/menubar.jsp"/>
	</header>
	
	<section class="container">
		<form id="noticeInsertFrm" action="${pageContext.request.contextPath}/notice/noticeInsert.do" method="post">
			<input type="hidden" name="memberNo" value="${member.memberNo}" />
			<div class="row">
				<label class="col-2">제목</label>
				<input type="text" class="form-control col-10" placeholder="제목" name="noticeTitle" id="noticeTitle" value="${n.noticeTitle}" required/>
			</div>
			<div class="row">
				<textarea name="noticeContent" class="col-12" cols="30" rows="10" style="resize:none;" required>${n.noticeContent}</textarea>
			</div>
			
			<br />
			
			<div class="row justify-content-md-center">
				<button id="btnSubmit" class="btn btn-primary btn-lg col-3">등록</button>&nbsp;
				<button class="btn btn-secondary btn-lg col-3" onclick="history.go(-1); return false;">취소</button>
			</div>
			
			<br />
		</form>
	</section>
	
	<footer>
		<c:import url="../common/footer.jsp"/>
		
		<script>
			$('#btnSubmit').on('click', function() {
				$('#noticeInsertFrm').submit();
			});
		</script>
	</footer>
</body>
</html>