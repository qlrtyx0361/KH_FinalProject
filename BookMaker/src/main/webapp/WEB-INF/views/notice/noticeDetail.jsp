<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${n.noticeTitle}</title>
	<c:import url="../common/header.jsp"/>
</head>
<body>
	<header>
		<c:import url="../common/menubar.jsp"/>
	</header>
	
	<section class="container">
		<div>
			<div class="row">
				<label class="col-2">제목</label>
				<input type="text" class="form-control col-10" placeholder="제목" name="noticeTitle" id="noticeTitle" value="${n.noticeTitle}" readonly/>
			</div>
			<div class="row">
				<label class="col-2">작성자</label>
				<input type="text" class="form-control col-4" name="noticeWriter" value="${n.memberId}" readonly/>
				<label class="col-2">조회수</label>
				<input type="text" class="form-control col-4" name="noticeCount" value="${n.noticeCount}" readonly/>
			</div>
			<div class="row">
				<textarea name="noticeContent" class="col-12" cols="30" rows="10" style="resize:none;" readonly>${n.noticeContent}</textarea>
			</div>
			
			<br />
			
			<div class="row justify-content-md-center">
				<button class="btn btn-outline-info col-3" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList.do'">리스트로</button>
			    <c:if test="${member.memberNo eq n.memberNo}">
			    &nbsp;
				<button class="btn btn-outline-info col-3" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/noticeUpdateForm.do?noticeNo=${n.noticeNo}'">수정</button>
				&nbsp;
				<button type="button" class="btn btn-danger col-3" onclick="location.href='${pageContext.request.contextPath}/notice/noticeDelete.do?noticeNo=${n.noticeNo}'">삭제</button>
				</c:if>
			</div>
			
			<br />
		</div>
	</section>
	
	<footer>
		<c:import url="../common/footer.jsp"/>
	</footer>
</body>
</html>