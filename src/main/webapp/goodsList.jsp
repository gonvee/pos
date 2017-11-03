<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="js/jquery-3.2.1.js"></script>

<title>商品列表</title>

<style type="text/css">

#form button {
	font-size: 22px;
	color: rgb(251, 247, 247);
	background-color: #03a9f4;
	border-radius: 5px;
	margin-top: 15px;
	padding: 5px 20px;
}

#list {
	border-collapse: collapse;
	border: 3px solid grey;
	border-radius: 2px;
}

#list tr td {
	border: 1px solid lightgrey;
	padding: 5px 15px;
}

#list  tr:first-child {
	background-color: gray;
}

</style>
</head>
<body>

	<form action="/pos/update" method="post" enctype="application/x-www-form-urlencoded" id="form" onsubmit="return false">
		<table id="list">
			<tr>
				<td>编号</td>
				<td>名称</td>
				<td>单位</td>
				<td>单价</td>
				<td>分类</td>
				<td>条码编号</td>
				<td>折扣</td>
			</tr>
			<c:forEach items="${gList}" var="goods">
				<tr>
					<td><c:out value="${goods.goodId }"></c:out></td>
					<td><c:out value="${goods.goodName }"></c:out></td>
					<td><c:out value="${goods.goodSku }"></c:out></td>
					<td><c:out value="${goods.goodPrice }"></c:out></td>
					<td><c:out value="${goods.goodCategory }"></c:out></td>
					<td><c:out value="${goods.goodItem }"></c:out></td>
					<td>
						<select name='<c:out value="${goods.goodId}"></c:out>'>
							<c:if test="${goods.goodDiscount == 0}">
								<option value="0" selected="selected">不打折</option>
								<c:forEach items="${discounts }" var="discount">
										<c:if test="${discount.discountId != 0}">
										<option value='<c:out value="${discount.discountId}" />'>
											<c:out value="${discount.discountLevel}" />
										</option>
										</c:if>
								</c:forEach>
							</c:if>

							<c:if test="${goods.goodDiscount != 0}">
								<option value="0">不打折</option>
									<c:forEach items="${discounts }" var="discount">
										<c:if test="${discount.discountId == goods.goodDiscount && discount.discountId != 0}" >
											<option value='<c:out value="${discount.discountId}" />' selected="selected">
												<c:out value="${discount.discountLevel}" />
											</option>
										</c:if>
										<c:if test="${discount.discountId != goods.goodDiscount && discount.discountId != 0}">
											<option value='<c:out value="${discount.discountId}" />'>
												<c:out value="${discount.discountLevel}" />
											</option>
										</c:if>
									</c:forEach>
							</c:if>
						</select>

					</td>
				</tr>
			</c:forEach>
		</table>
		<button id="update">保 存</button>
		<button id="testPrint">打印测试</button>
	</form>
</body>
<script type="text/javascript">
var goodsList = [];

function getGoods() {

    $("#form select").each(function () {
        var goods = new Object();
        goods.goodId = $(this).attr("name");
        goods.goodDiscount = $(this).val();
        goodsList.push(goods);
    });
}

$("#form #update").click(function(){
	getGoods();
 	$.ajax({  
 	    url : "/pos/update",  
 	    type : "POST",  
 	    data : JSON.stringify(goodsList),  
 	        dataType: 'json',  
 	               contentType:'application/json;charset=UTF-8',      
 	    success : function(result) {  
 	        console.log(result);  
 	    }  
 	});  
});

$("#form #testPrint").click(function(){
	getGoods();
 	$.ajax({  
 	    url : "/pos/print",  
 	    type : "POST"

 	});  
});
</script>

</html>
