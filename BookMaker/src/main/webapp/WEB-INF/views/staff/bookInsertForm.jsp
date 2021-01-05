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
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div class="container">
		<form action="" method="post">
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
					<td><input class="form-control-lg is-invalid" type="text" name="bookName" /></td>
				</tr>
				<tr>
					<td>저자</td>
					<td><input type="text" name="bookWriter" /></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="book" /></td>
				</tr>
				<tr>
					<td>정가</td>
					<td><input type="text" name="" /></td>
				</tr>
				<tr>
					<td>판매가</td>
					<td><input type="text" name="" /></td>
				</tr>
				<tr>
					<td>포인트</td>
					<td><input type="text" name="" /></td>
				</tr>
				<tr>
					<td>출간일</td>
					<td><input type="text" name="" /></td>
				</tr>
				<tr>
					<td>페이지 수</td>
					<td><input type="text" name="" /></td>
				</tr>
				<tr>
					<td>무게</td>
					<td><input type="text" name="" /></td>
				</tr>
				<tr>
					<td>ISBN</td>
					<td><input type="text" name="" /></td>
				</tr>
				<tr>
					<td>도서 소개</td>
					<td><textarea name="" id="" cols="30" rows="10"></textarea></td>
				</tr>
				<tr>
					<td>저자 소개</td>
					<td><textarea name="" id="" cols="30" rows="10"></textarea></td>
				</tr>
				<tr>
					<td>대표 이미지</td>
					<td><input type="file" name="" /></td>
				</tr>
				<tr>
					<td>상세 이미지</td>
					<td><input type="file" name="" /></td>
				</tr>
			</table>
		</form>
	</div>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>