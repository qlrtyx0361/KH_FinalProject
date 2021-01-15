<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<c:import url="../common/header.jsp"/>
	<style>
		div#update-container{width:400px; margin:0 auto; text-align:center;}
		div#update-container input, div#update-container select {margin-bottom:10px;}
	</style>
	
<div class="header">
	<div class="container-fluid px-md-5  pt-4 pt-md-5">
		<div class="row justify-content-between">
			<div class="col-md-8 order-md-last">
				<div class="row">
					<div class="col-md-6 text-center">
					<div class="col-md-6 d-md-flex justify-content-end mb-md-0 mb-3">
					</div>
					</div>
					</div>
					</div>
					</div>
					</div>
					</div>
					
		</head>
				
				
		<body>
		<!-- 프로필 -->
		     <div>
		       		
		     <span><a class="btn btn-outline-success my-2 my-sm-0" href="${pageContext.request.contextPath}/mypage/mypageprof.do?memberId=${member.memberId}" >${member.name}님, 의 프로필 보기</a></span>&nbsp;
		     	 		
		     </div>
		     
		<!-- 게시글 문의 -->
		          <div>
		       		
		     <span><a class="btn btn-outline-success my-2 my-sm-0" href="${pageContext.request.contextPath}/mypage/mypageinquiry.do?memberId=${member.memberId}" >${member.name}님, 의 문의 게시판 보기</a></span>&nbsp;
		     	 		
		     </div>
		     	       
		     	    
		       		   
		    	
		    		  
		      <c:import url="../common/footer.jsp"/>
<hr>
------------------------
<button onclick="payNow();"> 결제 버튼</button>

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

</body>
</html>
		  		     
		  		    
		 		
	
