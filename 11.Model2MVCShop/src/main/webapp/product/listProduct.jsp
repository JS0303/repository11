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

<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	

	//=====����Code �ּ� ó�� ��  jQuery ���� ======//
	//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetList(currentPage) {
		console.log(currentPage);
		var menu = $("input[name='menu']").val();
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu="+menu).submit();
	}
	//===========================================//
	//==> �߰��Ⱥκ� : "�˻�" ,  productName link  Event ���� �� ó��
	 $(function() {
		var menu = $("input[name='menu']").val();
		//==> �˻� Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����. 
			 $( "button.btn.btn-default" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
				fncGetList('1');
			});
			
			$( "td:nth-child(2)" ).css("color" , "red");
		
		
			//==> productName LINK Event ����ó��
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
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
																+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
																+"��ǰ�̸� : "+JSONData.prodName+"<br/>"
																+"������ : "+JSONData.prodDetail+"<br/>"
																+"��  �� : "+JSONData.price+"<br/>"
																+"����� : "+JSONData.regDateString+"<br/>"
																+"</h6>";
									//Debug...									
									//alert(displayValue);
									$("h6").remove();
									$( "#"+prodNo+"" ).html(displayValue);
								}
						});
					////////////////////////////////////////////////////////////////////////////////////////////	
			
				});
			//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			
			//==> �Ʒ��� ���� ������ ������ ??
			//==> �Ʒ��� �ּ��� �ϳ��� Ǯ�� ���� �����ϼ���.					
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");

	 });			
			
});	

</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
		
			<h3>��ǰ�����ȸ</h3>
			</div>

				<!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>

				<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
							<option value="2"
								${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
					</select>
					</div>
					
					<div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
					 <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="�˻���"
						value="${! empty search.searchKeyword ? search.searchKeyword : ''}" >
					</div>

					<button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
	<!-- table ���� �˻� Start /////////////////////////////////////-->
			
				
				<!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
				<tr>
					<th align="center">No</th>
					 <th align="left" >��ǰ��</th> 
					 <th align="left" >����</th>
					 <th align="left" >�����</th>					
					 <th align="left" >�������</th>
					 <th align="left">��������</th>
				</tr>
				</thead>
       
			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
						<td align="center">${ i }</td>
						<td align="left" title="Click : ��ǰ���� Ȯ��"><c:choose>
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
								<td align="left">�Ǹ���</td>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${product.prodTranCode eq '001'}">
										<td align="left">���ſϷ� <c:choose>
												<c:when test="${param.menu eq 'manage'}">
													<a
														href="updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=002">����ϱ�</a>
												</c:when>
											</c:choose>
										</td>
									</c:when>

									<c:when test="${product.prodTranCode eq '002'}">
										<td align="left">�����</td>
									</c:when>
									<c:when test="${product.prodTranCode eq '003'}">
										<td align="left">��ۿϷ�</td>
									</c:when>
									<c:when test="${product.prodTranCode eq '004'}">
										<td align="left">������</td>
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
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
	

			<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>