<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Book</title>
	<c:import url="../common/header.jsp" />
</head>
<body>
	<c:import url="../common/menubar.jsp" />
	
	<div class="container-fluid px-md-5">
		<div class="row">
			<c:forEach items="${list}" var="b">
			<div class="col-md-6 col-lg-4 d-flex">
				<div class="book-wrap d-lg-flex">
					<div class="img d-flex justify-content-end" style="background-image: url(${pageContext.request.contextPath}/resources/bookUpload/${b.fileName});">
						<div class="in-text">
							<a href="#" class="icon d-flex align-items-center justify-content-center" data-toggle="tooltip" data-placement="left" title="Add to cart">
								<span class="flaticon-shopping-cart"></span>
							</a>
						</div>
					</div>
					<div class="text p-4">
						<p class="mb-2"><span class="price">${ b.bookPrice }</span></p>
						<h2><a href="${pageContext.request.contextPath}/book/bookDetail.do?isbn=${b.isbn}">${b.bookName}</a></h2>
						<span class="position">${b.bookWriter}</span>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp" />
</body>
</html>