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
    <title>상품 등록</title>
    <style>
         *{
            margin: 0 auto;
        }
        #admin_page{
            text-align: center;
            width: 90%;
            height: 900px;
          
        }
        #admin_page .admin_title {
            
            margin-top: 60px;
            font-weight: bold;
        }
        #admin_menu{
            float: left;
            text-align: center;
            width: 150px;
            height: 300px;
            margin-top: 10%;
            margin-left: 70px;
            
        }
        #admin_menu  th{
            border-bottom: 1px solid black;
        }
        #admin_menu tr td{
            border-bottom: 1px solid black;
            
        }
        #product_list table{
            margin-top: 5%;
            margin-left: 35%;
            height: 400px;
            width: 500px;
            border-collapse: collapse;
            border: 1px solid black;
            
        }
        #product_list tr{
            border: 1px solid;
        }
        #product_list td{
            border: 1px solid;
        }  
        #logoutbtn{
            display: block;
            margin-right: 100px;
            width: 100px;
            float:right;
        }
        </style>
</head>

<body>
    <div id="admin_page">
            <div class="admin_title">        
                <h1>상품 등록</h1>
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
				<td><a href="order_list.do">주문 리스트</a></td>
			</tr>
			<tr>
				<td><a href="list_user.do"> 회원 리스트 </a></td>
			</tr>
			<tr>
				<td><a href="list_qna.do">QnA 리스트</a></td>
			</tr>
    </table>
    <c:forEach items="${updateproduct}" var="proinfo">
    <form action="updateproductDB.do" method="get">
			<div id="product_list">
			<table id="product_list">
			
				<tr>
					<td>상품코드</td>
					<td><input type="text" name="pnum" value=${proinfo.PNum } readonly></td>
				</tr>
				<tr>
					<td>상품이름</td>
					<td><input type="text" name="pname" value="${proinfo.pname }"></td>
				</tr>
				<tr>
					<td>상품 종류</td>
					<td><input type="text" name="pkind" value="${proinfo.pkind }"></td>
				</tr>
				<tr>
					<td>상품 가격</td>
					<td><input type="text" name="pprice" value="${proinfo.pprice }"></td>
				</tr>
				<tr>
					<td>상품 내용</td>
					<td><input type="text" name="pcontent" value="${proinfo.PContent }"></td>
				</tr>
				<tr>
					<td>상품 이미지명</td>
					<td><input type="text" name="pimage" value="${proinfo.pimage }"></td>
				</tr>
				<tr>
					<td>베스트상품 여부</td>
					<td><input type="text" name="pbest" value="${proinfo.pbest }"></td>
				</tr>
				
			</table>
			
			<br> <input type="submit" value="수정"> 
				 <input type="reset" value="취소">
				 <button onclick="location.href='admin.do'">상품 전체 리스트</button>
				</div>
		</form>
		</c:forEach>
</div>
</body>
</html>