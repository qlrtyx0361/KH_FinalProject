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
		
		
		* {

	font-family: 'Malgun gothic','Sans-Serif','Arial';
}

ul li {
	list-style:none;
}


.list-table tbody td{
	text-align:center;
	padding:100px 0;
	border-bottom:1px solid #CCC; height:20px;
	font-size: 140px 
}
#btn-add {
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	color:gray;
	border-width:medium;
	border-color: graytext;
	
}

#aa{

	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	color:gray;
	border-width:medium;
	border-color: graytext;
}

.bb{
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	color:gray;
	border-width:thick;
	border-color: blue;
	
	border-top:2px solid #09C;
	border-bottom:2px solid #09C;

}

.cc{

	text-decoration: none;
	font-size: 20px;
	font-weight: normal;
	color:gray;
	border-width:thick;
	border-color: aqua;
	
	
	border-bottom:2px solid ;


}

	</style>
	
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
			<section id="inquiry-container" class="container">
				<p id="aa">총 ${totalContents }건의 게시물이 있습니다.</p>
				<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goInquiryForm();"/>
				<table id="tbl-inquiry" class="table table-striped table-hover">
			
					<tr class="bb">
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>문의사항</th>
						<th>작성일</th>
						<th>첨부파일</th>
						<th>조회수</th>
						<th>답변확인</th>
					
					</tr>
			
		
					<c:forEach items="${list}" var="b"> 
					<tr id="${b.inquiryNo}" class="cc">
						<td>${b.inquiryNo}</td>
						<td>${b.inquiryTitle}</td>
						<td>${b.memberId}</td>
						<td>
							<c:if test="${b.inquiryTypeNo eq 1}">교환/환불</c:if>
							<c:if test="${b.inquiryTypeNo eq 2}">주문/결제</c:if>
							<c:if test="${b.inquiryTypeNo eq 3}">배송</c:if>
							<c:if test="${b.inquiryTypeNo eq 4}">도서</c:if>
							<c:if test="${b.inquiryTypeNo eq 5}">기타</c:if>
						</td>
						<td>${b.uploadDate}</td>
						<td align="center">
							<c:if test="${b.fileCount>0}">
								<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/file.png" width=16px>
							</c:if>
						</td>
						<td>${b.inquiryReadCount} </td>
						<%-- <td><c:if test="${b.inquiryNo eq inquiryAnswerNo}">확인</c:if></td> --%>
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

			//클릭시 상세보기 하는데 거기에 답변도 가져오게하는 시작점(클릭시 답변no는 해당 id 에 없으니 멤버id를 가져와서 답변no를 끄집어 낼 것이다 )
		
			
		</script>
	</div>
</body>
</html>