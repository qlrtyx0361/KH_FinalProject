<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 관리</title>
	<c:import url="../common/header.jsp"/>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div class="container">
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th>No</th>
					<th>아이디</th>
					<th>이름</th>
					<th>등급</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${list}">
				<tr id="${m.memberNo}">
					<td>${m.memberNo}</td>
					<td>${m.memberId}</td>
					<td>${m.name}</td>
					<td>${m.gradeName}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:out value="${pageBar}" escapeXml="false"/>
	</div>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		$(function(){
			$("tr[id]").on("click", function(){
				var memberNo = $(this).attr("id");

				location.href = "${pageContext.request.contextPath}/staff/memberDetail.do?memberNo=" + memberNo;
			});

			$('tr>td').parent().on('mouseenter', function() {
				$(this).css('cursor', 'pointer');
				$(this).attr('class', 'table-active');
			}).on('mouseleave', function() {
				$(this).css('cursor', 'default');
				$(this).removeAttr('class', 'table-active');
			});
		});
	</script>
</body>
</html>