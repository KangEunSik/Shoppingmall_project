 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fourman.dao.UserDao" %>
<%@ page import="com.fourman.dto.ProductDto" %>
<%@page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
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
       #product{
          margin-top: 50px;
          width:1400px;
          height: auto;
          display:inline-block;
      }
      #product .best_title h1{
          font-weight: bold;
     
        }
        #product .best_title h1::after{
        content: "";
        display: block;
        width: 1300px;
        border-bottom: 3px solid black;
        margin: 10px auto;
    }
     #product #best {     
            border-bottom: solid 2px black;
        }

        #product  .item {
            float: left;
            text-align: center;
            margin: 20px 0 0 32px;
        }

        #product .item ul {
            list-style: none;
        }

        #product  .item img {
            margin-top: 10px;
            width: 250px;
            height: 300px;
        }
        #product  .item img:hover {
            opacity: 0.5;
            border: 1px solid black;
        }

        #product  .item .subject {
            margin-top: 10px;
            color: #80a727;        
        }

        #product  .item .comment {
            margin-top: 5px;
            color: #888888;
        }

        #product  .item .price {
            margin-top: 5px;
            font-weight: bold;
            color: red;
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
                  <c:if test="${userId==null}">
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
                    </c:if>
                     <c:if test="${userId!=null}">
                     <div class="login_bar">
                        <ol>
                            <ul>
                              <li>
                                    <a href="logout.do">LOGOUT</a>
                                </li>
                                 <li>
                                    <a href="cart.do?userId=${userID }">MY PAGE</a>
                                </li>
                                <li>
                                    <a href="order_product.do?userId=${userId }"> ORDER</a>
                                </li>
                                <li>
                                    <a href="qnalist.do"> QnA</a>
                                </li>
                            </ul>
                        </ol>
                    </div>
                    </c:if>
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
        <div id="product">
            <div class="best_title">
                <h1>NEW</h1>
            </div>
            <c:forEach items="${New}" var="New">
            <div class="item">
                <ul>
                    <li><a href="detail_product.do?Pnum=${New.PNum }"><img src="images/${New.pimage }/${New.pimage }-0.JPG"></a></li>
                    <li class="subject">${New.pname }</li>
                    <li class="comment">${New.PContent }</li>
                    <li class="price">${New.pprice }원</li>                
                </ul>
            </div>
            </c:forEach>
   	   </div>
      
        
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
    
    </div>

</body>
</html>