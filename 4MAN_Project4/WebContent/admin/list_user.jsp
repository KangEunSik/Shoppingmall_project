<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.fourman.dao.AdminDao"%>
<%@ page import="com.fourman.dto.UserDto"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
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
</head>

<body>
    <div id="admin_page">
            <div class="admin_title">        
                <h1>회원 리스트</h1>
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
    <form action="amdin_user_search.do" method="get">
        <div id="product_menu">
            <input type="text" name="serach">
            <input type="submit" value="검색">
            <button onclick="location.href='list_user.do'">유저 전체 리스트</button>
        </div>
    </form>
    <table id="product_list"> 
        <tr>
            <td>아이디</td>
            <td>비밀번호</td>
            <td>이 름</td>
            <td>이메일</td>
            <td>주소</td>
            <td>젼화번호</td>
            <td>구분</td>
        </tr>
        <c:forEach items="${userList }" var="userlist">
        	<tr>
        	<td>${userlist.id }</td>
            <td>${userlist.pw }</td>
            <td>${userlist.userName }</td>
            <td>${userlist.email }</td>
            <td>${userlist.address }</td>
            <td>${userlist.phoneNum }</td>
            <td><input type="button" value="삭제" onclick="location.href='admin_user_delete.do?id=${userlist.id }'">
				
			</td>
        	</tr>
        </c:forEach>
        
         <c:forEach items="${search_user }" var="userlist">
        	<tr>
        	<td>${userlist.id }</td>
            <td>${userlist.pw }</td>
            <td>${userlist.userName }</td>
            <td>${userlist.email }</td>
            <td>${userlist.address }</td>
            <td>${userlist.phoneNum }</td>
            <td><input type="button" value="삭제" onclick="location.href='admin_user_delete.do?id=${userlist.id }'">
			</td>
        	</tr>
        </c:forEach>
        
    </table>
</div>
</body>
</html>