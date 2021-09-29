<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.pagination {
  display: inline-block;
  margin-top: 20px;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
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
			<h1>QnA 리스트</h1>
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
			<button onclick="location.'href=list_qna.do'">게시판 전체 리스트</button>
			
		</div>
		</form>	
		<table id="product_list">
			<tr>
				<th>게시판 번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>구분</th>
			</tr>
			<c:forEach items="${pageselect}" var="pageselect">
				<tr>
					<td>${pageselect.bid }</td>
					<td>${pageselect.id }</td>
					<td><c:forEach begin="1" end="${pageselect.bindent }">--</c:forEach>
					<a href="qnadetail_view.do?bid=${pageselect.bid }&page=${QnAPageDto.currentPageNum }
			&pageDataCount=${QnAPageDto.pageDataCount }">${pageselect.btitle }</a></td>
					<td>${pageselect.bdate }</td>
					<td>${pageselect.bhit }</td>
					<td><input type="button" value="삭제" onclick="location.href='admin_qna_delete.do?bid=${pageselect.bid }&userid=${pageselect.id }'">
				</tr>
			</c:forEach>
		</table>
				<div class="pagination">
		<a href="list_qna.do?page=${QnAPageDto.firstPageNum }
		&pageDataCount=${QnAPageDto.pageDataCount }">맨앞으로
			</a>
			<a href="list_qna.do?page=${QnAPageDto.prevPageNum }
		&pageDataCount=${QnAPageDto.pageDataCount }">앞으로
			</a>
			<c:forEach var="i" begin="${QnAPageDto.startPageNum }"
				end="${QnAPageDto.endPageNum }" step="1">

				<c:choose>
					<c:when test="${i eq QnAPageDto.currentPageNum }">
						<a href="list_qna.do?page=${i }
			&pageDataCount=${QnAPageDto.pageDataCount }">${i }
						</a>
					</c:when>
					<c:otherwise>
						<a href="list_qna.do?page=${i }
			&pageDataCount=${QnAPageDto.pageDataCount }">${i }
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<a href="list_qna.do?page=${QnAPageDto.nextPageNum }
		&pageDataCount=${QnAPageDto.pageDataCount }">뒤로
			</a>
			<a href="list_qna.do?page=${bPageDto.lastPageNum }
		&pageDataCount=${bPageDto.pageDataCount }">맨뒤로</a>
	</div>
	</div>
</body>
</html>