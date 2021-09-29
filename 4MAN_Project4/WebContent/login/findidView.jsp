<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fourman.dao.UserDao"%>
<%@ page import="com.fourman.dto.UserDto"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
       <script type="text/javascript">
	function cart(x){
		if(${userId!=null}){
			location.href="cart.do?userId=${userId}";
		}else if(${userId==null}){
			alert("로그인을 하세요");
			location.href="login.do";
		}
	}
	
	</script>
    <style>
          #form{
        margin-top: 100px;
    }

    #h2{
        margin-top: 100px;
    }

    div.create{
    width: 800px;
    text-align: center;
    padding: 30px;
    border-bottom: 1px solid black;
    margin: auto;
    }
 
    table{
    height: 300px;
    width: 1000px;
    border-top: 3px solid black;
    margin-right: auto;
    margin-left: auto;
    }
 
    td{
        border-bottom: 1px dotted black;
    }
 
    .col1 {
    background-color: #e8e8e8;
    padding: 10px;
    text-align: left;
    font-weight: bold;
    font-size: 0.8em;
    }
 
    .col2 {
    text-align: left;
    padding: 5px;
    }
 
    .but1 {
    height: 30px;
    width: 100px;
    color: white;
    background-color: #999;
    border: 2px solid #999;
    }

    .but2 {
    height: 30px;
    width: 100px;
    color: white;
    background-color: #999;
    border: 2px solid #999;
    }
 
    .but3 {
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    font-weight: bold;
    }
 
    .but4{
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    font-weight: bold;
    }
    
    .but1:hover {
    background-color: #b9b9b9;
    color: black;
    border: 2px solid black;
    }

    .but2:hover {
    background-color: #b9b9b9;
    color: black;
    border: 2px solid black;
    }
 
 
    .but3:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
 
    .but4:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
    </style>    
</head>

<body>
   
        <div id="header">
            <div class="menu">
                <input type="checkbox" id="menuicon">
                        <label for="menuicon">
                            <span></span>
                            <span></span>
                            <span></span>
                        </label>
                       <div class="sidebar">
                            <ol>
                                <ul>
                                <li>
                                       <a href="best_product.do"> BEST</a>
                                    </li>
                                    <li>
                                        <a href="new_product.do"> NEW</a>
                                    </li>
                                    <li>
                                        <a href="top_product.do"> TOP</a>
                                    </li>
                                    <li>
                                        <a href="pants_product.do"> PANTS</a>
                                    </li>
                                    <li>
                                        <a href="shoes_product.do">SHOES</a>
                                    </li>
                                </ul>
                            </ol>
                        </div>
            </div>
      
            
            <div class="logo">
                <h1><a href="index.do">4. MAN</a></h1>
            </div>
            <div class="nav">
                <div class="nav_icon">
                    <input type="checkbox" id="login">
                    <label for="login">
                          <img src="images/login_icon.png">
                          <span></span>
                          <span></span>
                     </label>
                   <div class="login_bar">
                        <ol>
                            <ul>
                                <li>
                                    <a href="login.do">LOGIN</a>
                                </li>
                                <li>
                                    <a href="join.do">JOIN</a>
                                </li>
                                <li>
                                    <a href="qnalist.do"> QnA</a>
                                </li>
                            </ul>
                        </ol>
                    </div>
                </div>
                <div class="nav_icon">
                    <div class="search">
                        <div>
                          <input type="text" placeholder="Search . . ." required>
                        </div>
                      </div>
                </div>
                <div class="nav_icon">
                    <a href="javascript:void(0)" onclick="cart(this)"> <img src="images/cart.png"></a>
                </div>
            </div>
        </div>
        
        <div id="blink">
          
        </div>
        <c:forEach items="${findId }" var="findId">
        <form action="find_pw.do" method="get">
        <table id="form">
            <h2 id="h2"><b>ID 찾기</b></h2>
  <tr>
      <td class="col1">ID</td>
      <td class="col2">${findId.id }</td>

  
  </table>


<div class="create">
    <input class="but3" type="button" value="PW 찾기" onclick="location.href='find_pw.do'">
</div>
</form>
</c:forEach>
        <div id="footer">
            <div class="footer_content">
                <ul>
                    <li>
                        <h4>CUSTOMER CENTER</h4>
                    </li>
                    <li class="font">
                        1234-5678
                    </li>
                    <li class="font">
                        AM 8:00 ~ PM 5:00
                    </li>
                    <li>

                    </li>
                    <li>
                        
                    </li>
                </ul>
            </div>
            <div class="footer_content">
                <ul>
                    <li>
                        <h4>Bank Info</h4>
                    </li>
                    <li class="font">
                        Human 123-1234-5678-09
                    </li>
                    <li class="font">
                       예금주 : human
                    </li>
                </ul>
            </div>
            <div class="footer_content">
                <ul>
                    <li>
                        <h4>COMPANY INFO</h4>
                    </li>
                    <li class="font">
                        COMPAY : 4.MAN
                    </li>
                    <li class="font">
                        Tel : 010-1234-5678
                    </li>
                    <li class="font">
                        Tel : 010-1234-5678
                    </li>  <li class="font">
                        Tel : 010-1234-5678
                    </li>
                </ul>
            </div>
            COPYRIGHT ©4.MAN ALL RIGHT RESERVED.
        </div>
    

</body>
</html>