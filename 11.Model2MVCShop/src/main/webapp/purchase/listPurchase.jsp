<%@ page contentType="text/html; charset=EUC-KR" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>

<%@ page import="com.model2.mvc.service.domain.Purchase"%>
<%@ page import="com.model2.mvc.service.domain.Product"%>
<%@ page import="com.model2.mvc.service.domain.User"%>
<%@ page import="com.model2.mvc.common.Search"%>
<%@ page import="com.model2.mvc.common.Page"%>

<%-- <%
	HashMap<String,Object> map=(HashMap<String,Object>)request.getAttribute("map");
	
	Search search=(Search)request.getAttribute("search");
	
	User user = (User)session.getAttribute("user");
	
	int total=0;
	
	ArrayList<Purchase> list=null;
		if(map != null){
	
			total=((Integer)map.get("count")).intValue();
	
	list=(ArrayList<Purchase>)map.get("list");
	}
	
	int currentPage=search.getCurrentPage();
	
	int totalPage=0;
		
		if(total > 0) {
			totalPage= total / search.getPageSize() ;
		if(total%search.getPageSize() >0)
			totalPage += 1;
	}
			
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


<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

	function fncGetList(currentPage) {
		console.log(currentPage);
		//document.getElementById("currentPage").value = currentPage;
		//document.detailForm.submit();
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action",
				"/purchase/listPurchase").submit();

	}
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header text-info">
		
		<h3>구매목록조회</h3>
	</div>

	<div class="row">

		<div class="col-md-6 text-left">
			<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재
				${resultPage.currentPage} 페이지</p>
		</div>

		<!--  table Start /////////////////////////////////////-->
		<table class="table table-hover table-striped">

			<thead>

				<tr>
					<th align="center" width="100">No</th>
					<th align="left"></th>
					<th align="left" width="150">회원ID</th>
					<th align="left"></th>
					<th align="left" width="150">회원명</th>
					<th align="left"></th>
					<th align="left">전화번호</th>
					<th align="left"></th>
					<th align="left">배송현황</th>
					<th align="left"></th>
					<th align="left">정보수정</th>
				</tr>
				
			</thead>

			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr class="ct_list_pop">
						<td align="center"><a
							href="/getPurchase?tranNo=${purchase.tranNo}">${i}</a></td>
						<td></td>
						<td align="left"><a href="/getUser?userId=${user.userId}">${user.userId}</a>
						</td>
						<td></td>
						<td align="left">${user.userName}</td>
						<td></td>
						<td align="left">${user.phone}</td>
						<td></td>
						<c:choose>
							<c:when test="${purchase.tranCode == null}">
								<td align="left">판매중</td>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${purchase.tranCode eq '001'}">
										<td align="left">현재 구매완료상태 입니다. <c:choose>
												<c:when test="${param.menu eq 'manage'}">
													<a
														href='updateTranCodeByProd?prodNo=${purchase.prodNo}&tranCode=002'>배송하기</a>
												</c:when>
											</c:choose>
										</td>
									</c:when>

									<c:when test="${purchase.tranCode eq '002'}">
										<td align="left">현재 배송중 입니다.</td>
									</c:when>
									<c:when test="${purchase.tranCode eq '003'}">
										<td align="left">배송이 완료되었습니다.</td>
									</c:when>
									<c:when test="${purchase.tranCode eq '004'}">
										<td align="left">코드 오류</td>
									</c:when>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<td></td>
						<c:if test="${purchase.tranCode eq '002'}">
							<td align="left"><a
								href="/updateTranCodeByProd?prodNo=${purchase.purchaseProd.prodNo}&tranCode=003">배송완료</a></td>
						</c:if>

						<td align="left"></td>

					</tr>
				</c:forEach>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				</tbody>
		</table>
		</div>
		</div>


		<jsp:include page="../common/pageNavigator_new.jsp" />
</body>
</html>