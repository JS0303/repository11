<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
<%@ page import="com.model2.mvc.service.domain.Product" %>
<%@ page import="com.model2.mvc.service.product.dao.*" %>
<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.common.*" %>

<%
	Product product=(Product)request.getAttribute("product");
		System.out.println("updateProduct.jsp에서 불러온 product : "+product);
%>
/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
  
  	<!-- CDN(Content Delivery Network) 호스트 사용 -->
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

////////////////유효성 검증 part ///////////////////////////
function fncUpdateProduct() {
	//Form 유효성 검증
	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();

	if (name == null || name.length < 1) {
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if (detail == null || detail.length < 1) {
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if (manuDate == null || manuDate.length < 1) {
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if (price == null || price.length < 1) {
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	

	$("form").attr("method" , "POST").attr("action","/product/updateProduct").submit();
}

	//=====기존Code 주석 처리 후  jQuery 변경 ======//
	//===========================================//

	//==> jQuery 적용 추가된 부분
		//==> 추가된부분 : "수정"  Event 연결
	$(function() {

		$("button.btn.btn-primary").on("click", function() {
			fncUpdateProduct();
		});
	});

	//==> "취소"  Event 연결

	$(function() {
		$("a[href='#' ]").on("click", function() {
			$("form")[0].reset();

		});
	});
	
	$(function() {
		$( "button.btn.btn-default" ).on("click" , function() {
			self.location="/product/listProduct?menu=manage";

		});
	});
	
	$( function() {
	    $( "#manuDate" ).datepicker();
	    $( "#manuDate" ).on( "change", function() {
	        $( "#manuDate" ).datepicker( "option", "dateFormat", "yy-mm-dd");
	      });
	  } );
	
	
</script>
</head>

<body >
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">상품정보수정</h3>
	       </div>
	       
	       <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<div class="form-group">
		<input type="hidden" name="prodNo" value="${product.prodNo}">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}" >
		    </div>
		  </div>
	       

	<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="prodDetail" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}">
		    </div>
		  </div>
		
		
			<div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate}">
		      &nbsp;
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" value="${product.price}">&nbsp;원
		    </div>
		  </div>
			
			
				<div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="fileName" name="fileName" value="${product.fileName}">
		    </div>
		  </div>
		
			
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			   <a class="btn btn-primary btn" href="#" role="button">원래상태로</a>
		      <button type="button" class="btn btn-default"  >상품목록으로</button>
		    </div>
		  </div>
		</form>
		
	</div>


</body>
</html>
