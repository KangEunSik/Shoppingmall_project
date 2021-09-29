<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fourman.dao.AdminDao"%>
<%@ page import="com.fourman.dto.ProductDto"%>
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
	function productBtn(x){
		var theForm=document.adminform;
		if(x=='search'){
			theForm.method="get";
			theForm.action="product_search.do";
		}else if(x=='insert'){
			theForm.action="insert_product.do";
		}else if(x=='list'){
			theForm.action="admin.do";
		}
		theForm.submit();
	}
</script>
</head>

<body>
	<div id="admin_page">
		<div class="admin_title">
			<h1>상품리스트</h1>
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
		<form name="adminform">
		<div id="product_menu">
			
				<input type="text"  name="searchname">
				<input type="button" onclick="productBtn('search')" value="검색">
		
			<button onclick="productBtn('insert')">상품 등록</button>
			<button onclick="productBtn('list')">상품 전체 리스트</button>
			
		</div>
		</form>	
		<table id="product_list">
			<tr>
				<th>상품코드</th>
				<th>상품이름</th>
				<th>상품 종류</th>
				<th>상품 가격</th>
				<th>상품 내용</th>
				<th>상품 이미지명</th>
				<th>베스트상품 여부</th>
				<th>상품등록일</th>
				<th>구분</th>
			</tr>
			<c:forEach items="${pdtos}" var="pdtos">
				<tr>
					<td>${pdtos.PNum }</td>
					<td>${pdtos.pname }</td>
					<td>${pdtos.pkind }</td>
					<td>${pdtos.pprice }</td>
					<td>${pdtos.PContent }</td>
					<td>${pdtos.pimage }</td>
					<td>${pdtos.pbest }</td>
					<td>${pdtos.pregist }</td>
					<td><input type="button" value="삭제" onclick="location.href='delete_prdouct.do?pnum=${pdtos.PNum }'">
						<input type="button" value="수정" onclick="location.href='update_prdouct.do?pnum=${pdtos.PNum }'">
					</td>
				</tr>
			</c:forEach>
				<c:forEach items="${search}" var="search">
				<tr>
					<td>${search.PNum }</td>
					<td>${search.pname }</td>
					<td>${search.pkind }</td>
					<td>${search.pprice }</td>
					<td>${search.PContent }</td>
					<td>${search.pimage }</td>
					<td>${search.pbest }</td>
					<td>${search.pregist }</td>
					<td><input type="button" value="삭제" onclick="location.href='delete_prdouct.do?pnum=${pdtos.PNum }'">
						<input type="button" value="수정" onclick="location.href='update_prdouct.do?pnum=${pdtos.PNum }'">
					</td>
				</tr>
			</c:forEach>
		</table>

	</div>
</body>
</html>