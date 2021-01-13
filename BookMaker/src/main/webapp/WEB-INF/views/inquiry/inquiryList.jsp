<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의게시판</title>
	<c:import url="../common/header.jsp"/>
	<style>
		/*글쓰기버튼*/
		input#btn-add{float:right; margin: 0 0 15px;}
	</style>
	
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
			<section id="inquiry-container" class="container">
				<p>총 ${totalContents }건의 게시물이 있습니다.</p>
				<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goInquiryForm();"/>
				<table id="tbl-inquiry" class="table table-striped table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>문의사항</th>
						<th>작성일</th>
						<th>첨부파일</th>
						<th>조회수</th>
					
					</tr>
					<c:forEach items="${list}" var="b"> 
					<tr id="${b.inquiryNo}">
						<td>${b.inquiryNo}</td>
						<td>${b.inquiryTitle}</td>
						<td>${b.memberId}</td>
						<td>${b.inquiryTypeNo}</td>
						<td>${b.uploadDate}</td>
						<td align="center">
							<c:if test="${b.fileCount>0}">
								<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/file.png" width=16px>
							</c:if>
						</td>
						<td>${b.inquiryReadCount} </td>
					</tr>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</section> 
		<c:import url="../common/footer.jsp"/>
		<script>
			function fn_goInquiryForm(){
				location.href = "${pageContext.request.contextPath}/inquiry/inquiryForm.do";
			}
		
			//클릭시 상세보기하는 작업
			$(function(){
				$("tr[id]").on("click",function(){
					var inquiryNo = $(this).attr("id");
					console.log("inquiryNo="+inquiryNo);
					location.href = "${pageContext.request.contextPath}/inquiry/inquiryView.do?no="+inquiryNo;
				});
			});
		</script>
	</div>
</body>
</html>