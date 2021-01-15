<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ </title>

<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
 

<style>
body{background:#f4f4f4}
.btn{padding:0;background:transparent;border:0;outline:0}

.accordion_area{ background-color: gray; color: #fff; cursor: pointer; padding: 10px; width: 100%; text-align: left; outline: none; font-size: 20px; transition: all 0.5s; }
.accordion_area .btn_toggle{color:teal;display:block;width:100%;height:50px;padding:0 10px;background:#fff;font-size:20px;text-align:left;line-height:30px;box-sizing:border-box}
.accordion_area .btn_toggle::before{display:inline;content:'Q.'} /* Q 에대해 */
.accordion_area .content_area{  padding: 0 18px; background-color: #fff; height: 100px; overflow: hidden; transition: all 0.5s; display:none;}
.accordion_area .content_area::before{color: black; display:inlnie;content:'A.'  } /* 눌렀을떄 A  */
.accordion_area .content_area.act{color:black; display:block}/*  눌렀을떄 글씨색 */
.active, .accordion_area:hover { background-color: teal; } /* 마우스 가져갔을때 */
.accordion_area:after { content:  color: black; font-weight: bold; float: right; margin-left: 5px; font-size: 25px; }

 
.accordion_area:focus,
.accordion_area:hover,
.menu h2:active {
    background : skyblue;
    color : yellow;
    text-shadow: none;
}

.content_area{
 font-size : 15px;
    display : block;
    color : white;
    text-decoration : none;
}

   div[id*=content] {
      display : none;
   }



h2{
 background-color: #ffffff;
 opacity: 1;
 color: purple;
 padding: 10px;
}

.menu div {
                width: 200px;
                height: 50px;
              
               
               display : inline-block; 
               
               font-size : 30px;
                list-style : none;
                 margin-right : auto;
                 text-decoration:none;
                  padding : 10px;
                   margin-left: 180px;
        }
        
   .menu div a {
text-decoration:none;
color : gray;
   
   }    



</style>

</head>
<body>
	<c:import url="../common/header.jsp"/>
   

   <h2 style="color:red;">FAQ</h2>
   
      <ul class="menu" >
        <div><li><a href="#content1"> 배송관련 </a></li></div>
        <div><li><a href="#content2"> 결제관련 </a></li></div>
        <div><li><a href="#content3"> 반품/환불관련 </a></li></div>
    </ul>
    
    <div class="content">
   <div id="content1">
      <div class="accordion_area" >
           <button class="btn btn_toggle">배송은 얼마나 걸리나요?</button>
           <div class="content_area">
              	결제 완료 및 입금 확인 건에 한해 주문해주신 제품은 평일 오전9시/오후2시 결제기준 택배포장이 시작되어 출고 됩니다. 배송 준비중 상태일 경우, 제품 포장이 완료되어 주문취소가 되지 않습니다. 제품 배송의 경우 출고 후 1-2일 정도 걸립니다.(택배사의 사정에 따라 배송 일정이 달라 질 수 있으며, 산간, 도서 지방의 경우에도 배송기간이 달라질 수 있습니다.)
				금요일 오후 2시 이후 및 주말 결제완료 및 입금 확인 건은 차주 월요일에 출고됩니다.

				택배사의 물량 폭주, 폭설이나 폭우 등의 자연재해, 당사 주문 폭주로 인한 일시품절이나 예약주문 중에는 출고 날짜가 달라질 수 있으니 공지사항을 확인해주시기 바랍니다.
           </div>
      </div>

      <div class="accordion_area" >
         <button class="btn btn_toggle">배송조회는 어떻게 하나요?</button>
         <div class="content_area">
            클럭의 회원이시라면 클럭홈페이지 -> 카트(CART)에서 바로 조회가 가능합니다.

			비회원이신 경우 주문조회-> 주문자명, 주문번호, 비밀번호를 입력해주시면 조회가 가능합니다. 또는 운송장번호를 이용하여 CJ대한통운 홈페이지에서도 확인이 가능합니다.

			(마이쇼핑에서 확인이 어려우신 경우 CJ대한통운 홈페이지에서 운송장번호를 통해 확인부탁드립니다)
         </div>
      </div>
   
      <div class="accordion_area" data-group="one">
         <button class="btn btn_toggle">어떤 택배사로 배송되나요?</button>
         <div class="content_area act">
             고객님의 물품은 CJ대한통운 택배사를 통해 안전하게 배송됩니다
         </div>
      </div>
   
      <div class="accordion_area" data-group="one">
         <button class="btn btn_toggle">배송비는 얼마인가요?</button>
         <div class="content_area">
             50,000원 이상 구매시 무료 배송을 해드리고 있습니다. 50,000원 미만 구매시에는 선불 배송비 2,500원이 추가 되오니 참고 부탁드립니다.

  			 (산간, 도서 지방의 경우에는 별도의 추가 금액을 지불해야하는 경우가 있습니다.)
         </div>
      </div>
   
  </div>



<div id="content2">
   <div class="accordion_area" >
  <button class="btn btn_toggle">결제내역에 대한 카드전표 출력은 어디에서 하나요? </button>
  <div class="content_area">
   
1. 관리자계정 로그인 후 우측 상단 프로필영역의 회사설정을 클릭합니다.

2. 요금 및 결제관리 > 즉시결제내역조회에서 납부월을 선택하시어 조회 후 카드전표를 인쇄합니다. 
  </div>
</div>

<div class="accordion_area" >
  <button class="btn btn_toggle">정기결제카드 변경 방법이 궁금해요.</button>
  <div class="content_area">
     요금 및 결제 관리 > 결제정보관리 > 결제수단변경버튼을 통해 결제카드를 변경합니다.
  </div>
</div>

<div class="accordion_area" data-group="one">
  <button class="btn btn_toggle">결제 시 팝업창이 뜨지 않아요</button>
  <div class="content_area act">
    팝업 차단으로 설정되어 있는 경우 팝업창이 노출되지 않으며, 팝업 허용후 다시 결제를 진행하시면 됩니다. 
  </div>
</div>

<div class="accordion_area" data-group="one">
  <button class="btn btn_toggle">서비스에 대한 청구서 수신자를 설정하고 싶은 경우 어떻게 하나요?</button>
  <div class="content_area">
   관리자계정 로그인 > 우측상단 프로필영역에 회사설정 > 회사정보관리 > 관리자설정 > 회사관리자에 추가 되어있으신 경우 해당 직원 모두에게 청구서가 발송되며, 별도로 설정을 원하시는 경우는 아래 방법으로 설정 가능합니다.
  </div>
</div>

   
</div>

<div id="content3">
   <div class="accordion_area" >
  <button class="btn btn_toggle">반품 조건</button>
  <div class="content_area">
    현재 문제가 발생하여 게임에서 액트 랭크 휘장을 비활성화했습니다.
담당 부서에서 빠른 문제를 해결하기 위해 최선을 다하겠습니다.
등급별 진행 상황, 게임 기록에는 영향이 없다는 점 참고 부탁드립니다.
  </div>
</div>

<div class="accordion_area" >
  <button class="btn btn_toggle">환불 조건</button>
  <div class="content_area">
  현재 문제가 발생하여 게임에서 액트 랭크 휘장을 비활성화했습니다.
담당 부서에서 빠른 문제를 해결하기 위해 최선을 다하겠습니다.
등급별 진행 상황, 게임 기록에는 영향이 없다는 점 참고 부탁드립니다.
  </div>
</div>

<div class="accordion_area" data-group="one">
  <button class="btn btn_toggle">교환 조건</button>
  <div class="content_area act">
    현재 문제가 발생하여 게임에서 액트 랭크 휘장을 비활성화했습니다.
담당 부서에서 빠른 문제를 해결하기 위해 최선을 다하겠습니다.
등급별 진행 상황, 게임 기록에는 영향이 없다는 점 참고 부탁드립니다.
  </div>
</div>

<div class="accordion_area" data-group="one">
  <button class="btn btn_toggle"> 고객센터 문의</button>
  <div class="content_area act">
이 모드는, 음, 개별 전투를 통해 실력을 갈고닦도록 설계되었습니다. 이유 없이 지은 이름이 아니라고요. 데스매치에는 “팀”이 없는 대신 14명의 플레이어들이 특정 규칙에 따라 서바이벌 게임에 참여합니다:
  </div>
</div>


   
</div>
</div>


   
<c:import url="../common/footer.jsp" />

<script>
   $('.content').children().each(function() {
      
   });
   $('a').on('click', function() {
      $('.content').children().each(function() {
         $(this).css({
            'display' : 'none'
         });
      });
      $($(this).attr('href')).css({
         'display' : 'block'
      });
   });
   
function bindingAccordionEvent(wrap){
     let areaArr = document.querySelectorAll(wrap);
     
     areaArr.forEach(function(area){
        let hasGroup = area.dataset['group'] !== undefined ? true : false;
       let btn = area.querySelector('.btn_toggle');
       
       btn.addEventListener('click', function(){
         if(hasGroup === true){
           let name = area.dataset['group'];
           let groupArr = document.querySelectorAll(wrap + '[data-group="'+ name +'"]');
           let thisContent = area.querySelector('.content_area');
           
           groupArr.forEach(function(group){
              let content = group.querySelector('.content_area');
             content.classList.remove('act');
           });
           thisContent.classList.add('act');
         }else{
           let content = area.querySelector('.content_area');
           content.classList.toggle('act');
         }
       });
     });
   }

   bindingAccordionEvent('.accordion_area');



</script>
   
</body>
</html>