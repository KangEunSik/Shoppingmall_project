<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fourman.dao.AdminDao"%>
<%@ page import="com.fourman.dto.OrderDto"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>admin page</title>
<style>
* {
	margin: 0 auto;
}

#admin_page {
	text-align: center;
	width: 90%;
	height: 900px;
}

#admin_page .admin_title {
	margin-top: 60px;
	font-weight: bold;
}

#admin_menu {
	float: left;
	text-align: center;
	width: 150px;
	height: 300px;
	margin-top: 10%;
	margin-left: 70px;
}

#admin_menu  th {
	border-bottom: 1px solid black;
}

#admin_menu tr td {
	border-bottom: 1px solid black;
}

#product_list {
	height: 0 auto;
	width: 1200px;
	margin-top: 13%;
	border-collapse: collapse;
	  border-collapse: separate;
  border-spacing: 0 15px;
}

#product_list th {
	border-right: 1px solid black;
}
#product_list td {
	border-right: 1px solid black;
}
#product_menu {
	border:1px solid balck;
	margin-top: 190px;
	float: right;
}

button {
	background-color: white;
}

#logoutbtn {
	display: block;
	margin-right: 100px;
	width: 100px;
	float: right;
}
</style>
<script>
</script>
</head>

<body>
	<div id="admin_page">
		<div class="admin_title">
			<h1>주문리스트</h1>
		</div>
		<div>
			<input type="button" id="logoutbtn" name="logout" onclick="location.href='logout.do'" value="로그아웃">
		</div>
		<table id="admin_menu">
			<th>Admin menu</th>
			<tr>
				<td><a href="admin.do"> 상품 리스트 </a></td>
			</tr>
			<tr>
				<td><a href="list_order.do">주문 리스트</a></td>
			</tr>
			<tr>
				<td><a href="list_user.do"> 회원 리스트 </a></td>
			</tr>
			<tr>
				<td><a href="list_qna.do">QnA 리스트</a></td>
			</tr>
		</table>
		  <form action="amdin_order_search.do" method="get">
        <div id="product_menu">
            <input type="text" name="serach">
            <input type="submit" value="검색">
            <button onclick="location.href='list_order.do'">유저 주문 리스트</button>
        </div>
    </form>
		<table id="product_list">
			<tr>
				<th>주문번호</th>
				<th>주문 아이디</th>
				<th>상품번호</th>
				<th>가격</th>
				<th>사이즈</th>
				<th>컬러</th>
				<th>주문 수량</th>
				<th>주문 날짜</th>
				<th>구분</th>
			</tr>
			<c:forEach items="${listorder}" var="listorder">
				<tr>
					<td>${listorder.ordernum }</td>
					<td>${listorder.userid }</td>
					<td>${listorder.pnum }</td>
					<td>${listorder.orderprice }</td>
					<td>${listorder.psize }</td>
					<td>${listorder.pcolor }</td>
					<td>${listorder.ordercount }</td>
					<td>${listorder.orderdate }</td>
					<td><input type="button" value="삭제" 
					onclick="location.href='admin_orer_delete.do?ordernum=${listorder.ordernum }'">
					</td>
				</tr>
			</c:forEach>
				<c:forEach items="${search_order}" var="search">
				<tr>
					<td>${search.ordernum }</td>
					<td>${search.userid }</td>
					<td>${search.pnum }</td>
					<td>${search.orderprice }</td>
					<td>${search.psize }</td>
					<td>${search.pcolor }</td>
					<td>${search.ordercount }</td>
					<td>${search.orderdate }</td>
					<td><input type="button" value="삭제" 
					onclick="location.href='admin_orer_delete.do?ordernum=${listorder.ordernum }'">
					</td>
				</tr>
			</c:forEach>
		</table>

	</div>
</body>
</html>