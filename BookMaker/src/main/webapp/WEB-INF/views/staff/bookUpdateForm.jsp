<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 수정</title>
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
			<form id="bookUpdateFrm" action="${pageContext.request.contextPath}/staff/bookUpdate.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="isbn" value="${b.isbn}"/>
				<table>
					<tr>
						<td>도서 분류</td>
						<td>
							<select name="genreName" class="custom-select">
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
						<td class="rows"><input class="form-control-lg is-invalid col-12" type="text" name="bookName" value="${b.bookName}"/></td>
					</tr>
					<tr>
						<td>저자</td>
						<td class="rows"><input class="form-control-lg is-invalid col-12" type="text" name="bookWriter" value="${b.bookWriter}"/></td>
					</tr>
					<tr>
						<td>출판사</td>
						<td class="rows"><input class="form-control-lg is-invalid col-12" type="text" name="bookPublisher" value="${b.bookPublisher}"/></td>
					</tr>
					<tr>
						<td>정가</td>
						<td class="rows"><input class="form-control-lg is-invalid col-12" type="number" name="bookPrice" value="${b.bookPrice}"/></td>
					</tr>
					<tr>
						<td>판매가</td>
						<td class="rows"><input class="form-control-lg is-invalid col-12" type="number" name="bookSellPrice" value="${b.bookSellPrice}"/></td>
					</tr>
					<tr>
						<td>포인트</td>
						<td class="rows"><input class="form-control-lg is-invalid col-12" type="number" name="bookPoint" value="${b.bookPoint}"/></td>
					</tr>
					<tr>
						<td>출간일</td>
						<td class="rows"><input class="form-control-lg is-invalid col-12" type="date" name="bookPublicationDate" value="${b.bookPublicationDate}"/></td>
					</tr>
					<tr>
						<td>페이지 수</td>
						<td class="rows"><input class="form-control-lg is-invalid col-12" type="number" name="bookPage" value="${b.bookPage}"/></td>
					</tr>
					<tr>
						<td>무게</td>
						<td class="rows"><input class="form-control-lg is-invalid col-12" type="number" name="bookWeight" value="${b.bookWeight}"/></td>
					</tr>
					<tr>
						<td>ISBN</td>
						<td class="rows"><input class="form-control-lg is-invalid col-12" type="number" name="ISBN" value="${b.isbn}" disabled/></td>
					</tr>
					<tr>
						<td>도서 소개</td>
						<td class="rows"><textarea name="bookIntro" id="" cols="80" rows="10">${b.bookIntro}</textarea></td>
					</tr>
					<tr>
						<td>저자 소개</td>
						<td class="rows"><textarea name="bookWriterIntro" id="" cols="80" rows="10">${b.bookWriterIntro}</textarea></td>
					</tr>
					<tr>
						<td>대표 이미지</td>
						<td>
							<div class="rows book-img">
							<c:forEach items="${biList}" var="bi" varStatus="vs">
								<c:if test="${bi.imageLevel eq 0}">
								<button type="button" class="btn btn-outline-success col-8"
										onclick="fileDownload('${bi.fileName}');" download>${bi.fileName}</button>
								<button type="button" class="btn btn-outline-danger col-3"
										onclick="fileDelete(this, '${bi.imageNo}', '${bi.fileName}');">파일 삭제</button>
								</c:if>
							</c:forEach>
								<input type="file" name="upFile" />
							</div>
						</td>
					</tr>
					<tr>
						<td>상세 이미지</td>
						<td>
							<div class="rows book-img">
							<c:forEach items="${biList}" var="bi" varStatus="vs">
								<c:if test="${bi.imageLevel ne 0}">
								<button type="button" class="btn btn-outline-success col-8"
										onclick="fileDownload('${bi.fileName}');" download>${bi.fileName}</button>
								<button type="button" class="btn btn-outline-danger col-3"
										onclick="fileDelete(this, '${bi.imageNo}', '${bi.fileName}');">파일 삭제</button>
								</c:if>
							</c:forEach>
								<input type="file" name="upFile" />
							</div>
						</td>
					</tr>
				</table>
				
				<button id="btnSubmit" class="btn btn-primary btn-lg">수정 완료</button>&nbsp;
				<button class="btn btn-secondary btn-lg" onclick="history.go(-1); return false;">취소</button>
			</form>
		</article>
	</section>
	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		$(function() {
			$('select option').each(function() {
				if($(this).val() == '${b.genreName}') {
					$(this).prop('selected', true);
				} 
			});

			$('input[type=file]').each(function() {
				$(this).css('display', 'none');
			});

			$('.book-img').each(function() {
				if($(this).children().eq(0).attr('type') == 'file') {
					$(this).children().eq(0).css('display', 'block');
				}
			});
		});

		function fileDownload(fileName){
			fileName = encodeURIComponent(fileName);
			location.href="${pageContext.request.contextPath}/staff/fileDownload.do?fileName=" + fileName;
		}
		
		function fileDelete(obj, imgNo, fileName){
			$.ajax({
				url : '${pageContext.request.contextPath}/staff/fileDelete.do',
				data : { imgNo : imgNo, fileName : fileName }, 
				dataType : 'json',
				success : function(data){
					if(data == true) {
						alert("첨부파일 삭제 완료!");
						$(obj).next().css('display', 'block');
						$(obj).parent().children('button').remove();
					} else {
						alert("첨부파일 삭제 실패!");
					}
				}, error : function(req, status, error){
					console.log(req);
					console.log(status);
					console.log(error);
				}
			});
		}
	
		$('#btnSubmit').on('click', function() {
			$('#bookUpdateFrm').submit();
		});
	</script>
</body>
</html>