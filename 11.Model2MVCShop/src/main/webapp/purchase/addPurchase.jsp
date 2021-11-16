<%@ page contentType="text/html; charset=EUC-KR" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.service.domain.Purchase"%>
<%@ page import="com.model2.mvc.common.*" %>
<%@ page import="com.model2.mvc.service.domain.User" %>
<%@ page import="com.model2.mvc.service.domain.Product" %>
<%@ page import="com.model2.mvc.service.domain.Purchase.*" %>

<%-- <%
	User user = (User)request.getAttribute("user");
		System.out.println(getClass().getName()+"addPurchase.jsp에서 불러온 userVO : "+user);
		
	Product product = (Product)request.getAttribute("product");
		System.out.println(getClass().getName()+"addPurchase.jsp에서 불러온 productVO : "+product);
		
	Purchase purchase=(Purchase)request.getAttribute("purchase");
		System.out.println(getClass().getName()+"addPurchase.jsp에서 불러온 purchaseVO : "+purchase);
		
	String payment = "신용구매";
%> --%>




<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<title>상품등록</title>
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	function fncAddPurchase() {
	}
<title>Insert title here</title>

</script>
</head>


<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">구매가 완료되었습니다.</h1>
		
	<!-- form Start /////////////////////////////////////-->

<form class="form-horizontal">
		  
		  <div class="form-group">
				<label for="prodname" class="col-sm-offset-1 col-sm-3 control-label">물품번호</label>
				<div class="col-sm-4">
							${purchase.purchaseProd.prodNo}
						</div>
					</div>
					
					
		  <div class="form-group">
				<label for="prodname" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
				<div class="col-sm-4">
							${purchase.buyer.userId}
						</div>
					</div>
					
					
		  <div class="form-group">
				<label for="prodname" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
				<div class="col-sm-4">
							${purchase.paymentOption}
						</div>
					</div>
					
					
		  <div class="form-group">
				<label for="prodname" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
				<div class="col-sm-4">
							${purchase.receiverName}
						</div>
					</div>
					
					
		  <div class="form-group">
				<label for="prodname" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
				<div class="col-sm-4">
							${purchase.receiverPhone}
						</div>
					</div>
					
					
		  <div class="form-group">
				<label for="prodname" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
				<div class="col-sm-4">
							${purchase.dlvyAddr}
						</div>
					</div>
					
					
		  <div class="form-group">
				<label for="prodname" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
				<div class="col-sm-4">
							${purchase.dlvyRequest}
						</div>
					</div>
					
					
		  <div class="form-group">
				<label for="prodname" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
				<div class="col-sm-4">
							${purchase.dlvyDate}
						</div>
					</div>
					
		  <div class="form-group">
				<label for="prodname" class="col-sm-offset-1 col-sm-3 control-label">주문상태코드</label>
				<div class="col-sm-4">
							${purchase.tranCode}
						</div>
					</div>


</form>

</body>
</html>