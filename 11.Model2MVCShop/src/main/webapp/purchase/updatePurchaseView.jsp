<%@ page contentType="text/html; charset=EUC-KR" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- <%@ page import="com.model2.mvc.service.domain.Purchase" %>
<%@ page import="com.model2.mvc.service.purchase.dao.*" %>
<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.common.*" %>

<%
	Purchase purchase = (Purchase)request.getAttribute("purchase");

	System.out.println("updatePurchaseView.jsp에서 불러온 purchaseVO : "+purchase);
	
	System.out.println("updatePurchaseView.jsp :: 배송날짜 확인 :: "+purchase.getDlvyDate());
%> --%>



<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

function fncUpdateProduct() {

	$("form").attr("method", "POST").attr("action","../purchase/updatePurchase").submit();
}

$(function() {

	$("button.btn.btn-primary").on("click", function() {
		fncAddProduct();
	});
});

$(function() {
	$("a[href='#' ]").on("click", function() {
		$("form")[0].reset();

	});
});


</script>

</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">구매정보수정</h3>
	       </div>
	
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<div class="form-group">
		<input type="hidden" name="buyerId" value="${product.prodNo}">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}" >
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="buyer.userId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">
		      <input type="buyer.userId" class="form-control" id="buyer.userId" name="buyer.userId" value="${purchase.buyer.userId}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">
		      <select    name="paymentOption"    class="ct_input_g" style="width: 100px; height: 30px" 
                     maxLength="20">
            <option value="1" selected="selected">현금구매</option>
            <option value="2">신용구매</option>
         </select>
		    </div>
		  </div>
	
		<div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		    <div class="col-sm-4">
		      <input type="receiverName" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}">
		    </div>
		  </div>
		  
	<div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
		    <div class="col-sm-4">
		      <input type="receiverPhone" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}">
		    </div>
		  </div>
		  
	
	
	<div class="form-group">
		    <label for="receiverAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
		    <div class="col-sm-4">
		      <input type="receiverAddr" class="form-control" id="receiverAddr" name="receiverAddr" value="${purchase.dlvyAddr}">
		    </div>
		  </div>
		  
	<div class="form-group">
		    <label for="receiverRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		    <div class="col-sm-4">
		      <input type="receiverRequest" class="form-control" id="receiverRequest" name="receiverRequest" value="${purchase.dlvyRequest}">
		    </div>
		  </div>  
	
	<div class="form-group">
		    <label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="dlvyDate" class="form-control" id="dlvyDate" name="dlvyDate" value="${purchase.dlvyDate}">
		    </div>
		  </div>
		  
		  
	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		
	</div>

</body>
</html>