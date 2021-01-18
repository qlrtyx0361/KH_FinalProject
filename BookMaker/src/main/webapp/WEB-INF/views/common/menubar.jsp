<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<style>
.login {

 	float:right; 
 	text-decoration: none;
	font-size: 15px;
	font-style:inherit;
	color:black;
	
	/* border-color: graytext; */
	font-weight:bolder;
	
	border-width:thick;
	border-radius:20px;
	border-left:2px solid #09C;
	border-top:2px solid #09C;
	border-bottom:2px solid #09C;
	
	


}
.login2 {

	 	float:right; 
 	text-decoration: none;
	font-size: 15px;
	font-style:inherit;
	color:black;
	
	/* border-color: graytext; */
	font-weight:bolder;
	
	border-width:thick;
	border-radius:20px;
	border-left:2px solid #09C;
	border-top:2px solid #09C;
	border-bottom:2px solid #09C;



}




</style>


			<div class="header">

			<div class="container-fluid px-md-5  pt-4 pt-md-5">
			<div class="row justify-content-between">
				<div class="col-md-8 order-md-last">
					<div class="row">	
						<div class="col-md-6 text-center">
						 <img src="../resources/images/KakaoTalk_20201216_181640231.png" >
							<a class="navbar-brand" href="index.jsp">Publishing <span>Company</span> <small>Book Publishing Company</small></a>
						</div>
						<div class="col-md-6 d-md-flex justify-content-end mb-md-0 mb-3">
							<form action="#" class="searchform order-lg-last">
			          <div class="form-group d-flex">
			            <input type="text" class="form-control pl-3" placeholder="Search">
			            <button type="submit" placeholder="" class="form-control search"><span class="fa fa-search"></span></button>
			          </div>
			        </form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-4 d-flex">
		</div>
		<div class="col-md-4 d-flex">
					<div class="social-media">
		    		<p class="mb-0 d-flex">
		    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-dribbble"><i class="sr-only">Dribbble</i></span></a>
		    		</p>
	       		 </div>
				</div>
		
				<div>
				<!-- 로그인,회원가입 버튼 -->
				<c:if test="${empty member}">
				
		  		 <button class="login"  type="button"onclick="location.href='${pageContext.request.contextPath}/member/memberloginform.do'">로그인</button> &nbsp;
		  		 <button class="login2" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll.do'">회원가입</button>
		    	 </c:if>
		     
		    	 <!-- 로그인 된 후  -->
				 <c:if test="${!empty member}">
				  <button class="login" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">로그아웃</button>
			    
			     <!--  마이페이지 -->
				  
					 <button class="login" onclick="location.href='${pageContext.request.contextPath}/mypage/mypageView.do?memberId=${member.memberId}'" >${member.name}님 의 마이페이지</button>&nbsp;
				 
			 </c:if>
		    		  
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
		        	<li class="nav-item"><a href='${pageContext.request.contextPath}/inquiry/inquiryList.do' class="nav-link">문의 게시판</a></li>
		        	<li class="nav-item"><a href='${pageContext.request.contextPath}/Faq/Faq.do' class="nav-link"> FAQ </a></li>
		        </ul>
			</div>
		</div>
	</nav>
	
	
	
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
</html>