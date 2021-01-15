<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="header">
	<div class="container-fluid px-md-5  pt-4 pt-md-5">
		<div class="row justify-content-between">
			<div class="col-md-8 order-md-last">
				<div class="row">
					<div class="col-md-6 text-center">
					<div >
					<img src="../images/로고.jpg" alt="로고">
					</div>
						<a class="navbar-brand" href="index.jsp" >책 사 <span>Book Maker</span> <small>책을 사랑하는 사람들</small></a>
						
						
					</div>
					<div class="col-md-6 d-md-flex justify-content-end mb-md-0 mb-3">
						<form action="#" class="searchform order-lg-last">
		          			<div class="form-group d-flex">
		            			<input type="text" class="form-control pl-3" placeholder="도서 검색!">
		            			<button type="submit"  class="form-control search" href="${pageContext.request.contextPath}">
		            			<span class="fa fa-search"></span></button>
		          			</div>
		
		        		</form>
		        		<div>
		        		<!-- 로그인,회원가입 버튼 -->
		        		<c:if test="${empty member}">
		     		   <button class="btn btn-outline-success my-2 my-sm-0" type="button" data-toggle="modal" data-target="#loginModal">로그인</button> &nbsp;
		      		   <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll.do'">회원가입</button>
		     	       </c:if>
		     	       
		     	       <!-- 로그인 된 후  -->
		  			  <c:if test="${!empty member}">
		        	  <span><a href="${pageContext.request.contextPath}/member/memberView.do?memberId=${member.memberId}" title="내정보보기">${member.name}</a> 님</span>&nbsp;
		       		  
		       		  <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">로그아웃</button>
		       		    
		       		     <!--  마이페이지 -->
		       		  <div>
		  		     <span><a class="btn btn-outline-success my-2 my-sm-0" href="${pageContext.request.contextPath}/mypage/mypageView.do?memberId=${member.memberId}" >${member.name}님, 의 마이페이지</a></span>&nbsp;
		  		     </div>
		  		     
		  		     	<!--  결제 관련 -->
		       			  <div>
		       			  <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="payNow();"> 결제하기</button>
		       		  
						</div>

		       		   
		    		  </c:if>
		    		  
		      		  </div>
		      		  
		 		     <!-- 게시판 -->
		 		     <div>
		    		 <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href='${pageContext.request.contextPath}/inquiry/inquiryList.do'">문의 게시판</button>
		  		     </div>
		  		     	
		  		     	<!-- FAQ 게시판 -->
		  		      <div>
		    		 <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href='${pageContext.request.contextPath}/Faq/Faq.do'">FAQ 게시판</button>
		  		     </div>
		  		     
		  		     
		  		    
		  		     
		 			</div>
		        		
				</div>
					
				</div>
			</div>
			<div class="col-md-4 d-flex">
				
			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container-fluid">
	    	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	    		<span class="fa fa-bars"></span> Menu
	    	</button>
	    	<div class="collapse navbar-collapse" id="ftco-nav">
		        <ul class="navbar-nav m-auto">
		        	<li class="nav-item"><a href="#" class="nav-link">Home</a></li>
		        	<li class="nav-item"><a href="${pageContext.request.contextPath}/views/book/about.jsp" class="nav-link">About</a></li>
		        	<li class="nav-item"><a href="#" class="nav-link">Coming Soon</a></li>
		        	<li class="nav-item"><a href="#" class="nav-link">Top Seller</a></li>
		        	<li class="nav-item active"><a href="#" class="nav-link">Books</a></li>
		        	<li class="nav-item"><a href="#" class="nav-link">Author</a></li>
		        	<li class="nav-item"><a href="#" class="nav-link">Blog</a></li>
		        	<li class="nav-item"><a href="#" class="nav-link">Contact</a></li>
		        </ul>
			</div>
		</div>
	</nav>
	<!-- Modal시작 -->
	
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="loginModalLabel">로그인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
          <!--로그인폼 -->
          <!-- https://getbootstrap.com/docs/4.1/components/forms/#overview -->
          <form action="${pageContext.request.contextPath}/member/memberLogin.do" method="post">
	      <div class="modal-body">
			  <input type="text" class="form-control" name="memberId" placeholder="아이디" required>
			    <br />
			    <input type="password" class="form-control" name="password" placeholder="비밀번호" required>
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-outline-success">로그인</button>
	        <button type="button" class="btn btn-outline-success" data-dismiss="modal">취소</button>
	      </div>
		</form>
	    </div>
	  </div>
	</div>
	<!-- Modal 끝-->
	
	
	<!-- 결제관련 스크립트 -->
	

	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
$(function(){
    var IMP = window.IMP; // 생략가능
    IMP.init('imp35036912'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
});

function payNow() {
	
    var msg;
    
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : 'KH Books 도서 결제',
        amount : 50000,
        buyer_email : 'test@example.com',
        buyer_name : ' 이진솔',
        buyer_tel : '01011112222',
        buyer_addr : '서울시 강남구 역삼동',
        buyer_postcode : '123-456'
    }, function(rsp) {
        if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            $.ajax({
                url: "결제 완료되면 보낼 컨트롤러", //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'POST',
                dataType: 'json',
                data: {
                    imp_uid : rsp.imp_uid
                    //기타 필요한 데이터가 있으면 추가 전달
                }, success : function(data){
                    }
            });
        } else {
            msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            //실패시 이동할 페이지
            location.href="<%=request.getContextPath()%>/order/payFail";
            alert(msg);
        }
    });
}
</script> 
	<!-- 결제관련 스크립트 끝 -->
</div>