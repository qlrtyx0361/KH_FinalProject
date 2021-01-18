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
	.container{
	width: 500px;
	height: 800px;
	border: 1px solid lightgray;
	margin: 50px auto;
	position: relative;
	
	}
	
	.pink-box {
	
	
	height: 500px;
	background-color: silver;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 10 100px;
	
	
	}
	
	.line {
	margin-bottom: 10px;
	color: white;
	
	
	}
	
	.white-box {
	
	height: 300px;
	
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content:space-around;
	padding: 0 100px;
	}
	
	/* ----------------- */
	
	
	.profile-message {
	text-align: center;
	color: white;
	
	
	}
	
	.image{
	width: 300px;
	display: flex;
	justify-content: space-around;
	align-items: center;
	font-size: 10pt;
	}
	
	.icon {
	
	width: 40px;
	height: 40px;
	
	}
	
	
	.chat-icon {
	
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content:center;
	
	}
	
	.profile-icon {
	
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content:center;
	
	}
	
	.qutate-icon {
	
	display: flex;
	flex-direction: column;
	
	justify-content:center;
	
	}
	
	.photo1 {
	width: 100px;
	height: 100px;
	top:450px;
	left: 190px;
	object-fit: cover;
	border-radius: 50%;
	position: absolute;
	}
	
	h6{
	color:black;
	font-weight: bold;
	
	}
	



</style>
	
</head>
				
	
	<body>
		
		<div class="container">
		<div class="pink-box">
		<div class="line">_______</div>
		<div class="profile-message">
		<h1>My Pageh</h1>
		
		</div>
		</div>
		<img 
		class="photo1"
		src="../resources/images/default-user.png" 
		alt="profile image"/>
		<h6>${member.name}님 의 마이페이지</h6>
		
		<div class="white-box" >
		<h3></h3>
		
		<div class="image">
		<div class="chat-icon" >
		<img class="icon"src="../resources/images/색상1.PNG" alt="chat" />
		<a href="${pageContext.request.contextPath}/mypage/mypageprof.do?memberId=${member.memberId}"><h4>프로필 관리</h4></a>
		</div>
		
		
		<div class="profile-icon">
		<img class="icon" src="../resources/images/색상2.PNG" alt="Profile" />
		<a href="${pageContext.request.contextPath}/mypage/mypageinquiry.do?memberId=${member.memberId}"><h4>1대1문의 게시판</h4></a>
		</div>
		
		
		<div claa="qutate-icon">
			<img class="icon" src="../resources/images/색상3.PNG" alt="Qutation" />
			<h4>결제 장바구니</h4>
		</div>
		</div>
			</div>
				</div>
				
				</body>
			
		       		   
		    
		    		  
	
	
		
	    
	      
		      
		      
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


</html>
		  		     
		  		    
		 		
	
