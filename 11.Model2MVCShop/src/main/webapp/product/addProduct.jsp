<%@ page contentType="text/html; charset=EUC-KR" isELIgnored="false"%>

<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.service.domain.Product"%>
<%@ page import="com.model2.mvc.common.*" %>

<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
<%
	Product product=(Product)request.getAttribute("product");
		System.out.println("addProduct.jsp에서 불러온 product : "+product);
%>
/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>

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
	
	//=====기존Code 주석 처리 후  jQuery 변경 ======//
	function fncAddProduct() {
	}
	//===========================================//
	
		//==> jQuery 적용 추가된 부분
		 $(function() {
		//==> 추가된부분 : "확인"  Event 연결
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "button.btn.btn-primary" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('확인')" ).html() );
				
				 self.location = "/product/listProduct?menu=manage";
			
			});
			
	
		//==> 추가된부분 : "추가등록"  Event 연결
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $(  "a[href='#' ]" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('추가등록')" ).html() );
				self.location = "../product/addProductView.jsp";
				
			});
		});	

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
	
		<h1 class="bg-primary text-center">상품등록</h1>
		
	<!-- form Start /////////////////////////////////////-->


	<form class="form-horizontal">
		  
		  <div class="form-group">
				<label for="prodname" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
				<div class="col-sm-4">
							${product.prodName}
						</div>
					</div>

	
	<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      ${product.prodDetail}
		    </div>
		  </div>

	
	<div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      ${product.manuDate}
		    </div>
		  </div>
	
	
	<div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      ${product.price}&nbsp;원
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      ${product.fileName}
		    </div>
		  </div>
	
	
	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >확 &nbsp;인</button>
			  <a class="btn btn-primary btn" href="#" role="button">추 가 &nbsp;등 록</a>
		    </div>
		  </div>
		</form>
		
	</div>
		  

	

</body>
</html>

