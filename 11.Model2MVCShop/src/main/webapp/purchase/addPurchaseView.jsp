<%@ page contentType="text/html; charset=EUC-KR" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.util.*"%>
<%@ page import="com.model2.mvc.service.purchase.*"%>
<%@ page import="com.model2.mvc.common.*"%>
<%@ page import="com.model2.mvc.service.domain.User"%>
<%@ page import="com.model2.mvc.service.domain.Product"%>
<%@ page import="com.model2.mvc.service.domain.Purchase"%>


<%-- <%
User user = (User)session.getAttribute("user");
Product product = (Product)request.getAttribute("product");

%> --%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>상품등록</title>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}
</style>

<script type="text/javascript">
	function fncAddPurchase() {
		//document.addPurchase.submit();
		$("form").attr("method", "POST").attr("action", "/purchase/addPurchase").submit();
	}

	$(function() {
		$("button.btn.btn-primary").on("click", function() {
			
			fncAddPurchase();
		});
	});

	$(function() {

		$("button.btn.btn-default").on("click", function() {
			self.location = "/product/listProduct?menu=search";
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

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		<div class="container">
			<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
		</div>
	</div>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<h1 class="bg-primary text-center">상품구매</h1>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

			<input type="hidden" name="prodNo" value="${product.prodNo}" />

			<div class="form-group">
				<label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
				<div class="col-sm-4">
						<div class="well well-sm">${product.prodNo}</div>
				</div>
			</div>

			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
				<div class="col-sm-4">
					<div class="well well-sm">${product.prodName}</div>
				</div>
			</div>

			<div class="form-group">
				<label for="prodDetail"
					class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
				<div class="col-sm-4">
				<div class="well well-sm">${product.prodDetail}</div>
				</div>
			</div>

			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
				<div class="col-sm-4">
					<div class="well well-sm">${product.manuDate}</div>
				</div>
			</div>

			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
				<div class="col-sm-4">
				<div class="well well-sm">${product.price}</div>
				</div>
			</div>


		

			<div class="form-group">
				<label for="buyer.userId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
				<div class="col-sm-4">
				<div class="well well-sm">${user.userId}</div>
					<input type="hidden" name="buyer.userId"
						value="${user.userId}" />
				</div>
			</div>


			<div class="form-group">
				<label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
				<div class="col-sm-4">
					<select name="paymentOption" class="ct_input_g"
						style="width: 100px; height: 19px" maxLength="20">
						<option value="1" selected="selected">현금구매</option>
						<option value="2">신용구매</option>
					</select>
				</div>
			</div>


			<div class="form-group">
				<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverName"
						name="receiverName" value="${user.userName}">
				</div>
			</div>


			<div class="form-group">
				<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverPhone"
						name="receiverPhone" value="${user.phone}">
				</div>
			</div>


			<div class="form-group">
				<label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="dlvyAddr"
						name="dlvyAddr" value="${user.addr}">
				</div>
			</div>


			<div class="form-group">
				<label for="dlvyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="dlvyRequest"
						name="dlvyRequest" placeholder="요청사항을 입력하세요.">
				</div>
			</div>


			<div class="form-group">
				<label for="dlvyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="dlvyDate"
						name="dlvyDate" placeholder="배송희망일자"> &nbsp;
				</div>
			</div>


			<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >구 &nbsp;매</button>
			  <a class="btn btn-primary btn" href="#" role="button">다시입력하기</a>
		      <button type="button" class="btn btn-default"  >상품목록으로</button>
		    </div>
		  </div>
		</form>
		
	</div>


</body>
</html>