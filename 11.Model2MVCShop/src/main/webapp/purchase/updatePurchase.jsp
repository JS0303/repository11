<%@ page contentType="text/html; charset=EUC-KR" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- <%@ page import="com.model2.mvc.service.domain.Purchase" %>
<%@ page import="com.model2.mvc.service.purchase.dao.*" %>
<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.common.*" %>

<%
	Purchase purchase = (Purchase)request.getAttribute("purchase");

	System.out.println("updatePurchase.jsp���� �ҷ��� purchaseVO : "+purchase);
	
	String payment = "�ſ뱸��";
%> --%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
  
  	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

function fncUpdatePurchase() {
	$("form").attr("method" , "POST").attr("action","/purchase/updatePurchase").submit();
}
//==>����
$(function() {

	$("button.btn.btn-primary").on("click", function() {
		fncUpdatePurchase();
	});
});


//==>�������·�
$(function() {
		$("a[href='#' ]").on("click", function() {
			$("form")[0].reset();

		});
	});
	
	//==> ���Ÿ������
	$(function() {
		$( "button.btn.btn-default" ).on("click" , function() {
			self.location="/purchase/listPurchase?menu=manage";

		});
	});
	
	$(function() {
		$("#dlvyDate").datepicker();
		$("#dlvyDate").on("change", function() {
			$("#dlvyDate").datepicker("option", "dateFormat", "yy-mm-dd");
		});
	});

</script>
</head>

<body >
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
	<div class="page-header text-center">
	       <h3 class=" text-info">���Ż���ȸ</h3>
	       </div>
			
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<div class="form-group">
		<input type="hidden" name="purchaseProd" value="${purchase.purchaseProd.prodNo}">
		    <label for="purchaseProd" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="purchaseProd" name="purchaseProd" value="${purchase.purchaseProd.prodNo}" >
		    </div>
		  </div>

		<div class="form-group">
		    <label for="buyer.userId" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="buyer.userId" name="buyer.userId" value="${purchase.buyer.userId}">
		    </div>
		  </div>
		  
		  
		<div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="paymentOption" name="paymentOption" value="${fn:trim(purchase.paymentOption) eq '1' ? '���ݱ���' : '�ſ뱸��'}">
		    </div>
		  </div>
		  
		
		<div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}">
		    </div>
		  </div>
		  
		  
		<div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}">
		    </div>
		  </div>
		  
		  
		<div class="form-group">
		    <label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${purchase.dlvyAddr}">
		    </div>
		  </div>
		  
		  
		<div class="form-group">
		    <label for="dlvyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dlvyRequest" name="dlvyRequest" value="${purchase.dlvyRequest}">
		    </div>
		  </div>
		  
		  
		<div class="form-group">
		    <label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dlvyDate" name="dlvyDate" value="${purchase.dlvyDate}">
		    </div>
		  </div>
		  
		  
		<div class="form-group">
		    <label for="orderDate" class="col-sm-offset-1 col-sm-3 control-label">�ֹ���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="orderDate" name="orderDate" value="${purchase.orderDate}">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			   <a class="btn btn-primary btn" href="#" role="button">�������·�</a>
		      <button type="button" class="btn btn-default"  >��ǰ�������</button>
		    </div>
		  </div>
		</form>
		
	</div>

	

</body>
</html>