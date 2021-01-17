<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항</title>
	<c:import url="../common/header.jsp"/>
	<style>
		table {
			text-align: center;
		}
	</style>
</head>
<body>
	<header>
		<c:import url="../common/menubar.jsp"/>
	</header>
	
	<section class="container">
		<article>
			<button class="btn btn-primary btn-lg float-right" id="btnNewNotice">공지 등록</button><br/><br/>
			
			<table class="table">
				<thead class="thead-light">
					<tr>
						<th style="width: 10%;">번호</th>
						<th style="width: 60%;">제목</th>
						<th style="width: 20%;">작성자</th>
						<th style="width: 10%;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${list}">
					<tr id="${n.noticeNo}">
						<td>${n.noticeNo}</td>
						<td>${n.noticeTitle}</td>
						<td>${n.memberId}</td>
						<td>${n.noticeCount}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:out value="${pageBar}" escapeXml="false"/>
		</article>
	</section>
	
	<footer>
		<c:import url="../common/footer.jsp"/>
		
		<script>
			$(function(){
				$("tr[id]").on("click", function(){
					var noticeNo = $(this).attr("id");
	
					location.href = "${pageContext.request.contextPath}/notice/noticeDetail.do?noticeNo=" + noticeNo;
				});
	
				$('tr>td').parent().on('mouseenter', function() {
					$(this).css('cursor', 'pointer');
					$(this).attr('class', 'table-active');
				}).on('mouseleave', function() {
					$(this).css('cursor', 'default');
					$(this).removeAttr('class', 'table-active');
				});
			});

			$('#btnNewNotice').on('click', function() {
				location.href = "${pageContext.request.contextPath}/notice/noticeInsertForm.do";
			});
		</script>
	</footer>
</body>
</html>