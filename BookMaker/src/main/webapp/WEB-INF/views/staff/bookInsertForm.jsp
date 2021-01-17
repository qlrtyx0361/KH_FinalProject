<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 등록</title>
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
			<form id="bookInsertFrm" action="${pageContext.request.contextPath}/staff/bookInsert.do" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<td>도서 분류</td>
						<td>
							<select name="genreName" class="custom-select">
								<option value="IT" selected>IT</option>
								<option value="소설">소설</option>
								<option value="경제">경제</option>
								<option value="자격증">자격증</option>
								<option value="외국어">외국어</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>도서명</td>
						<td><input class="form-control-lg is-invalid col-12" type="text" name="bookName" /></td>
					</tr>
					<tr>
						<td>저자</td>
						<td><input class="form-control-lg is-invalid col-12" type="text" name="bookWriter" /></td>
					</tr>
					<tr>
						<td>출판사</td>
						<td><input class="form-control-lg is-invalid col-12" type="text" name="bookPublisher" /></td>
					</tr>
					<tr>
						<td>정가</td>
						<td><input class="form-control-lg is-invalid col-12" type="number" name="bookPrice" /></td>
					</tr>
					<tr>
						<td>판매가</td>
						<td><input class="form-control-lg is-invalid col-12" type="number" name="bookSellPrice" /></td>
					</tr>
					<tr>
						<td>포인트</td>
						<td><input class="form-control-lg is-invalid col-12" type="number" name="bookPoint" /></td>
					</tr>
					<tr>
						<td>출간일</td>
						<td><input class="form-control-lg is-invalid col-12" type="date" name="bookPublicationDate" /></td>
					</tr>
					<tr>
						<td>페이지 수</td>
						<td><input class="form-control-lg is-invalid col-12" type="number" name="bookPage" /></td>
					</tr>
					<tr>
						<td>무게</td>
						<td><input class="form-control-lg is-invalid col-12" type="number" name="bookWeight" /></td>
					</tr>
					<tr>
						<td>ISBN</td>
						<td><input class="form-control-lg is-invalid col-12" type="number" name="isbn" /></td>
					</tr>
					<tr>
						<td>도서 소개</td>
						<td><textarea name="bookIntro" id="" cols="80" rows="10"></textarea></td>
					</tr>
					<tr>
						<td>저자 소개</td>
						<td><textarea name="bookWriterIntro" id="" cols="80" rows="10"></textarea></td>
					</tr>
					<tr>
						<td>대표 이미지</td>
						<td><input type="file" name="upFile" /></td>
					</tr>
					<tr>
						<td>상세 이미지</td>
						<td><input type="file" name="upFile" /></td>
					</tr>
				</table>
				
				<button id="btnSubmit" class="btn btn-primary btn-lg">등록</button>&nbsp;
				<button class="btn btn-secondary btn-lg" onclick="history.go(-1); return false;">취소</button>
			</form>
		</article>
	</section>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		$('#btnSubmit').on('click', function() {
			$('#bookInsertFrm').submit();
		});
	</script>
</body>
</html>