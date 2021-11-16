<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<%@ page import="com.model2.mvc.service.domain.Product"%>
<%@ page import="com.model2.mvc.common.Search"%>
<%@ page import="com.model2.mvc.common.Page"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	

	//=====기존Code 주석 처리 후  jQuery 변경 ======//
	//검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
		console.log(currentPage);
		var menu = $("input[name='menu']").val();
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu="+menu).submit();
	}
	//===========================================//
	//==> 추가된부분 : "검색" ,  productName link  Event 연결 및 처리
	 $(function() {
		var menu = $("input[name='menu']").val();
		//==> 검색 Event 연결처리부분
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함. 
			 $( "button.btn.btn-default" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
				fncGetList('1');
			});
			
			$( "td:nth-child(2)" ).css("color" , "red");
		
		
			//==> productName LINK Event 연결처리
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
			if(menu=="manage"){
			$( "td:nth-child(2)").on("click" , function() {
					//Debug..
					//alert(  $( this ).text().trim() );
					self.location ="/product/updateProduct?prodNo="+$(this).find("input[name=prodNo]").val();
					
					
					});
			}else{
				$( "td:nth-child(2)").on("click" , function() {
					self.location ="/product/getProduct?prodNo="+$(this).find("input[name=prodNo]").val();
				});
			}
	 
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
	 $(function() {
		 $( "td:nth-child(6) > i" ).css("color" , "red");
		 //alert($( "td:nth-child(6) > i" ).val());
			$( "td:nth-child(6) > i" ).on("click" , function() {

					var prodNo = $(this).find("input[name=prodNo]").val();
					
					$.ajax( 
							{
								url : "/product/json/getProduct/"+prodNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									//Debug...
									//alert(status);
									//Debug...
									//alert("JSONData : \n"+JSONData);
									
									var displayValue = "<h6>"
																+"상품번호 : "+JSONData.prodNo+"<br/>"
																+"상품이름 : "+JSONData.prodName+"<br/>"
																+"상세정보 : "+JSONData.prodDetail+"<br/>"
																+"가  격 : "+JSONData.price+"<br/>"
																+"등록일 : "+JSONData.regDateString+"<br/>"
																+"</h6>";
									//Debug...									
									//alert(displayValue);
									$("h6").remove();
									$( "#"+prodNo+"" ).html(displayValue);
								}
						});
					////////////////////////////////////////////////////////////////////////////////////////////	
			
				});
			//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			
			//==> 아래와 같이 정의한 이유는 ??
			//==> 아래의 주석을 하나씩 풀어 가며 이해하세요.					
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");

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
	
		<div class="page-header text-info">
		
			<h3>상품목록조회</h3>
			</div>

				<!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>

				<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
							<option value="2"
								${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
					</div>
					
					<div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
					 <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어"
						value="${! empty search.searchKeyword ? search.searchKeyword : ''}" >
					</div>

					<button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
	<!-- table 위쪽 검색 Start /////////////////////////////////////-->
			
				
				<!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
				<tr>
					<th align="center">No</th>
					 <th align="left" >상품명</th> 
					 <th align="left" >가격</th>
					 <th align="left" >등록일</th>					
					 <th align="left" >현재상태</th>
					 <th align="left">간략정보</th>
				</tr>
				</thead>
       
			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
						<td align="center">${ i }</td>
						<td align="left" title="Click : 상품정보 확인"><c:choose>
								<c:when
									test="${role eq 'user'}||${role == null} && ${product.prodTranCode != null}">
							${product.prodName}
							<input type="hidden" name="prodNo"	value="${product.prodNo}"> 
							<input type="hidden" name="menu" value="${param.menu}">
							<input type="hidden" name="regDate" value="${product.regDate}">
							<input type="hidden" name="prodTranCode" value="${product.prodTranCode}">
							</c:when>
								<c:otherwise>
									<a
										href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>
								</c:otherwise>
							</c:choose></td>
							
						
						<td align="left">${product.price}</td>						
						<td align="left">${product.regDate}</td>
						<c:choose>
							<c:when test="${product.prodTranCode == null}">
								<td align="left">판매중</td>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${product.prodTranCode eq '001'}">
										<td align="left">구매완료 <c:choose>
												<c:when test="${param.menu eq 'manage'}">
													<a
														href="updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=002">배송하기</a>
												</c:when>
											</c:choose>
										</td>
									</c:when>

									<c:when test="${product.prodTranCode eq '002'}">
										<td align="left">배송중</td>
									</c:when>
									<c:when test="${product.prodTranCode eq '003'}">
										<td align="left">배송완료</td>
									</c:when>
									<c:when test="${product.prodTranCode eq '004'}">
										<td align="left">재고없음</td>
									</c:when>
								</c:choose>
							</c:otherwise>
						</c:choose>					
						<td align="left">
						<i class="glyphicon glyphicon-ok" id="${product.prodNo}">
							<input type="hidden" name="prodNo" value="${product.prodNo}">
						</i>
						</td> 						
					</tr>
				</c:forEach>
				
			</tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
	

			<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>