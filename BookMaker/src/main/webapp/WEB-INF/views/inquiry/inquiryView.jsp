<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 상세보기</title>
	<c:import url="../common/header.jsp"/>
	<style>
		div#board-container{width:400px; margin:0 auto; text-align:center;}
		div#board-container input,div#board-container button{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
		
		
		
		
		body {
  background-image: #34495e;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}

.bottomText {
  text-align: center;
}
	</style>
	<script>
		function fileDownload(oName, rName){
			//한글파일명이 있을 수 있으므로, 명시적으로 encoding
			oName = encodeURIComponent(oName);
			location.href="${pageContext.request.contextPath}/inquiry/fileDownload.do?oName="+oName+"&rName="+rName;
		}
	</script>
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
		<div id="board-container">
			<input type="text" class="form-control" placeholder="제목" name="inquiryTitle" id="inquiryTitle" value="${inquiry.inquiryTitle }" required>
			
			<input type="text" class="form-control" placeholder="문의종류" name="inquiryTypeNo" id="inquiryTypeNo" value="${inquiry.inquiryTypeNo }" required>
						
			<input type="text" class="form-control" name="memberId" value="${inquiry.memberId}" readonly required>
			<c:if test="${!empty inquiryFileList  }">
				<c:forEach items="${inquiryFileList}" var="a" varStatus="vs">
					<button type="button" 
							class="btn btn-outline-success btn-block"
							onclick="fileDownload('${a.inquiryFilename}','${a.renameFilename }');">
						첨부파일${vs.count} - ${a.inquiryFilename }
					</button>
				</c:forEach>
			</c:if>
		    <textarea class="form-control" name="inquiryContent" placeholder="내용" required>${inquiry.inquiryContent }</textarea>
		   
		    <br>
		    <button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/inquiry/inquiryList.do'">리스트로</button>
		    
		    
		    <c:if test="${(member.memberId eq inquiry.memberId) or member.memberId eq 'admin' }">
		    &nbsp;
			<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/inquiry/inquiryUpdateView.do?inquiryNo=${inquiry.inquiryNo}'">수정 페이지</button>
			<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/inquiry/answerView.do?inquiryNo=${inquiry.inquiryNo}'">답변 보기!</button>
			
			 <c:if test="${member.memberId eq 'admin'}">
			<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/inquiry/inquiryAnswer.do?inquiryNo=${inquiry.inquiryNo}'">답변 하기</button>
			</c:if>
			</c:if>
		</div>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>