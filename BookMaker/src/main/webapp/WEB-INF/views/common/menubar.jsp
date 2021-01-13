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
		            			<input type="text" class="form-control pl-3" placeholder="Search">
		            			<button type="submit" placeholder="" class="form-control search"><span class="fa fa-search"></span></button>
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
		  		     
		  		      <!--  마이페이지 -->
		  		      <div>
		  		     
		  		     <span><a class="btn btn-outline-success my-2 my-sm-0" href="${pageContext.request.contextPath}/member/memberView.do?memberId=${member.memberId}" >${member.name}님, 의 마이페이지</a></span>&nbsp;
		  		     </div>
		  		     
		 			</div>
		        		
				</div>
					
				</div>
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
</div>