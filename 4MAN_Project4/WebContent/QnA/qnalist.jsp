<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script type="text/javascript">
	function cart(x){ 
		if(${userId!=null}){
			location.href="cart.do?userId=${userId}";
		}else if(${userId==null}){
			alert("로그인을 하세요");
			location.href="login.do";
		}
	}
	function searchClick(){
		var searchValue=document.getElementById('searchId').value;
        var form=document.searchform;
        if(searchValue!=""){
        	form.method="get";
        	form.action="search_product.do";
        	form.submit();
        	alert(serchValue);
        }else{
        	
        }
	}
    function writecheck(){
    	
    	if(${userId==null}){
    		alert("로그인이 필요합니다");
    		location.href="login.do";
    	}else if(${userId!=null}){
    		location.href="qnawrite_view.do";
    	}
    }
		
	
	</script>
<style>
#QnA {
	margin-top: 50px;
}

#QnA a:link {
	color: black;
	text-decoration: none;
}

#QnA a:hover {
	color: gray;
	text-decoration: underline;
}

#QnA table {
	width: 1000px;
	border-top: 2px solid black;
}

#QnA table td {
	padding: 5px;
	border-bottom: 0.5px solid gray;
}

#QnA table .th1 {
	padding: 10px;
	width: 100px;
	border-bottom: 1px solid gray;
}

#QnA table .th2 {
	width: 100px;
	border-bottom: 1px solid gray;
}

#QnA table .th3 {
	width: 300px;
	border-bottom: 1px solid gray;
}

#QnA table .th4 {
	width: 150px;
	border-bottom: 1px solid gray;
}

#QnA table .th5 {
	width: 50px;
	border-bottom: 1px solid gray;
}

#writeBtn {
	height: 30px;
	width: 1000px;
	margin-top: 10px;
}

#writeBtn input {
	float: right;
	background-color: white;
	border: 1px solid gray;
	width: 100px;
}

#writeBtn input:hover {
	border: 1px solid rgb(0, 225, 255);
	color: rgb(0, 225, 255);
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

.pagination a:hover:not(.active) {border: 1px solid rgb(0, 225, 255)}
</style>
</head>

<body>
	<div id="header">
		<div class="menu">
			<input type="checkbox" id="menuicon"> <label for="menuicon">
				<span></span> <span></span> <span></span>
			</label>
			<div class="sidebar">
				<ol>
					<ul>
						<li><a href="best_product.do"> BEST</a></li>
						<li><a href="new_product.do"> NEW</a></li>
						<li><a href="top_product.do"> TOP</a></li>
						<li><a href="pants_product.do"> PANTS</a></li>
						<li><a href="shoes_product.do">SHOES</a></li>
					</ul>
				</ol>
			</div>
		</div>

		<div class="logo">
			<h1>
				<a href="index.do">4. MAN</a>
			</h1>
		</div>
		<div class="nav">
			<div class="nav_icon">
				<input type="checkbox" id="login"> <label for="login">
					<img src="images/login_icon.png"> <span></span> <span></span>
				</label>

				<c:if test="${userId==null}">
					<div class="login_bar">
						<ol>
							<ul>
								<li><a href="login.do">LOGIN</a></li>
								<li><a href="join.do">JOIN</a></li>
								<li><a href="QnA.do"> QnA</a></li>
							</ul>
						</ol>
					</div>
				</c:if>
				<c:if test="${userId!=null}">
					<div class="login_bar">
						<ol>
							<ul>
								<li><a href="logout.do">LOGOUT</a></li>
								<li><a href="cart.do?userId=${userID }">MY PAGE</a></li>
								<li><a href="order_product.do?userId=${userId }"> ORDER</a>
								</li>
								<li><a href="qnalist.do"> QnA</a></li>
							</ul>
						</ol>
					</div>
				</c:if>


			</div>
			<div class="nav_icon">
				<form name="searchform">
					<div class="search">
						<div>
							<input type="text" id="searchId" name="searchname"
								placeholder="Search . . ." required onclick="searchClick()">
						</div>
					</div>
				</form>
			</div>
			<div class="nav_icon">
				<a href="javascript:void(0)" onclick="cart(this)"> <img
					src="images/cart.png"></a>
			</div>
		</div>
	</div>

	<div id="blink"></div>
	<div id="QnA">
		<h2>4MAN 게시판</h2>
		<table>
			<tr>
				<th class="th1">게시판 번호</th>
				<th class="th2">아이디</th>
				<th class="th3">제목</th>
				<th class="th4">작성일</th>
				<th class="th5">조회수</th>
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
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="writeBtn">
		<input type="button" value="글쓰기" onclick="writecheck()">
	</div>
	<div class="pagination">
		<a href="qnalist.do?page=${QnAPageDto.firstPageNum }
		&pageDataCount=${QnAPageDto.pageDataCount }">맨앞으로
			</a>
			<a href="qnalist.do?page=${QnAPageDto.prevPageNum }
		&pageDataCount=${QnAPageDto.pageDataCount }">앞으로
			</a>
			<c:forEach var="i" begin="${QnAPageDto.startPageNum }"
				end="${QnAPageDto.endPageNum }" step="1">

				<c:choose>
					<c:when test="${i eq QnAPageDto.currentPageNum }">
						<a href="qnalist.do?page=${i }
			&pageDataCount=${QnAPageDto.pageDataCount }">${i }
						</a>
					</c:when>
					<c:otherwise>
						<a href="qnalist.do?page=${i }
			&pageDataCount=${QnAPageDto.pageDataCount }">${i }
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<a href="qnalist.do?page=${QnAPageDto.nextPageNum }
		&pageDataCount=${QnAPageDto.pageDataCount }">뒤로
			</a>
			<a href="qnalist.do?page=${bPageDto.lastPageNum }
		&pageDataCount=${bPageDto.pageDataCount }">맨뒤로</a>
	</div>
	<div id="footer">
		<div class="footer_content">
			<ul>
				<li>
					<h4>
						CUSTOMER CENTER
						</h1>
				</li>
				<li class="font">1234-5678</li>
				<li class="font">AM 8:00 ~ PM 5:00</li>
				<li></li>
				<li></li>
			</ul>
		</div>
		<div class="footer_content">
			<ul>
				<li>
					<h4>
						Bank Info
						</h1>
				</li>
				<li class="font">Human 123-1234-5678-09</li>
				<li class="font">예금주 : human</li>
			</ul>
		</div>
		<div class="footer_content">
			<ul>
				<li>
					<h4>
						COMPANY INFO
						</h1>
				</li>
				<li class="font">COMPAY : 4.MAN</li>
				<li class="font">Tel : 010-1234-5678</li>
				<li class="font">Tel : 010-1234-5678</li>
				<li class="font">Tel : 010-1234-5678</li>
			</ul>
		</div>
		COPYRIGHT ©4.MAN ALL RIGHT RESERVED.
	</div>

	</div>

</body>
</html>
