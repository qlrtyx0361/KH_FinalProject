<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${b.bookName}</title>
	<c:import url="../common/header.jsp"/>
	<style>
		textarea {
			resize: none;
		}
	</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<section class="container">
		<article>
			<table>
				<tr>
					<td>도서 분류</td>
					<td>
						<select name="genreName" class="custom-select" disabled>
							<option value="IT">IT</option>
							<option value="소설">소설</option>
							<option value="경제">경제</option>
							<option value="자격증">자격증</option>
							<option value="외국어">외국어</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>도서명</td>
					<td><input class="form-control-lg is-invalid" type="text" name="bookName" value="${b.bookName}" disabled/></td>
				</tr>
				<tr>
					<td>저자</td>
					<td><input class="form-control-lg is-invalid" type="text" name="bookWriter" value="${b.bookWriter}" disabled/></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input class="form-control-lg is-invalid" type="text" name="bookPublisher" value="${b.bookPublisher}" disabled/></td>
				</tr>
				<tr>
					<td>정가</td>
					<td><input class="form-control-lg is-invalid" type="number" name="bookPrice" value="${b.bookPrice}" disabled/></td>
				</tr>
				<tr>
					<td>판매가</td>
					<td><input class="form-control-lg is-invalid" type="number" name="bookSellPrice" value="${b.bookSellPrice}" disabled/></td>
				</tr>
				<tr>
					<td>포인트</td>
					<td><input class="form-control-lg is-invalid" type="number" name="bookPoint" value="${b.bookPoint}" disabled/></td>
				</tr>
				<tr>
					<td>출간일</td>
					<td><input class="form-control-lg is-invalid" type="date" name="bookPublicationDate" value="${b.bookPublicationDate}" disabled/></td>
				</tr>
				<tr>
					<td>페이지 수</td>
					<td><input class="form-control-lg is-invalid" type="number" name="bookPage" value="${b.bookPage}" disabled/></td>
				</tr>
				<tr>
					<td>무게</td>
					<td><input class="form-control-lg is-invalid" type="number" name="bookWeight" value="${b.bookWeight}" disabled/></td>
				</tr>
				<tr>
					<td>ISBN</td>
					<td><input class="form-control-lg is-invalid" type="number" name="isbn" value="${b.isbn}" disabled/></td>
				</tr>
				<tr>
					<td>도서 소개</td>
					<td><textarea name="bookIntro" id="" cols="80" rows="10" disabled>${b.bookIntro}</textarea></td>
				</tr>
				<tr>
					<td>저자 소개</td>
					<td><textarea name="bookWriterIntro" id="" cols="80" rows="10" disabled>${b.bookWriterIntro}</textarea></td>
				</tr>
				<tr>
					<td>대표 이미지</td>
					<td>
						<c:forEach items="${biList}" var="bi">
						<c:if test="${bi.imageLevel eq 0}">
						<button type="button" class="btn btn-outline-success btn-block" 
							onclick="fileDownload('${bi.fileName}');">${bi.fileName}</button>
						</c:if>
						</c:forEach>
						
					</td>
				</tr>
				<tr>
					<td>상세 이미지</td>
					<td>
						<c:forEach items="${biList}" var="bi">
						<c:if test="${bi.imageLevel ne 0}">
						<button type="button" class="btn btn-outline-success btn-block">${bi.fileName}</button>
						</c:if>
						</c:forEach>
					</td>
				</tr>
			</table>
			
			<button type="button" id="btnUpdate" class="btn btn-primary btn-lg">수정</button>&nbsp;
			<button type="button" id="btnDelete" class="btn btn-danger btn-lg">삭제</button>
		</article>
	</section>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		$('#btnUpdate').on('click', function() {
			location.href="${pageContext.request.contextPath}/staff/bookUpdateForm.do?isbn=${b.isbn}";
		});

		$('#btnDelete').on('click', function() {
			location.href="${pageContext.request.contextPath}/staff/bookDelete.do?isbn=${b.isbn}";
		});

		$(function() {
			$('select option').each(function() {
				if($(this).val() == '${b.genreName}') {
					$(this).prop('selected', true);
				} 
			})
		});

		function fileDownload(fileName){
			fileName = encodeURIComponent(fileName);
			location.href="${pageContext.request.contextPath}/staff/fileDownload.do?fileName=" + fileName;
		}
	</script>
</body>
</html>