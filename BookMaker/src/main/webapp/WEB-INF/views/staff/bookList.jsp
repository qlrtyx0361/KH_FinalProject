<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 관리</title>
	<c:import url="../common/header.jsp"/>
</head>
<body>
	<header>
		<c:import url="../common/menubar.jsp"/>
	</header>
	
	<section class="container">
		<article>
			<button class="btn btn-primary btn-lg float-right" id="btnNewBook">도서 등록</button><br/><br/>
			
			<table class="table">
				<thead class="thead-light">
					<tr>
						<th>도서분류</th>
						<th>도서명</th>
						<th>저자</th>
						<th>출판사</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="b" items="${list}">
					<tr id="${b.isbn}">
						<td>${b.genreName}</td>
						<td>${b.bookName}</td>
						<td>${b.bookWriter}</td>
						<td>${b.bookPublisher}</td>
						<td>${b.bookPrice}</td>
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
					var isbn = $(this).attr("id");
	
					location.href = "${pageContext.request.contextPath}/staff/bookDetail.do?isbn=" + isbn;
				});
	
				$('tr>td').parent().on('mouseenter', function() {
					$(this).css('cursor', 'pointer');
					$(this).attr('class', 'table-active');
				}).on('mouseleave', function() {
					$(this).css('cursor', 'default');
					$(this).removeAttr('class', 'table-active');
				});
			});

			$('#btnNewBook').on('click', function() {
				location.href = "${pageContext.request.contextPath}/staff/bookInsertForm.do";
			});
		</script>
	</footer>
</body>
</html>