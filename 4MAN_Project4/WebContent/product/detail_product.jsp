<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fourman.dao.UserDao" %>
<%@ page import="com.fourman.dto.ProductDto" %>
<%@ page import="java.util.*" %>
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
    function order(choice){
   		var theForm= document.orderform;
   		if(${userId==null}){
   			alert("로그인 해주세요");
   			location.href="login.do";
   		}else if(${userId!=null}){
   			if(choice=='buy'){
   				theForm.method="get";
   				theForm.action="order_productAction.do";
   			}
   			else if(choice='cart'){
   				theForm.method="get";
   				theForm.action="cartAction.do";
   			}
    		
    		theForm.submit();
   		}
    }
    	
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
      section#order {
            width:100%;
            float: left;                                    
        }

        section#order #order1 h2 {
            margin-top: 0;         
            padding-bottom: 10px;    
            border-bottom: solid 2px black;
        }

        section#order #order1 h3 {
            font-size: 25px;           
            border-bottom: solid 2px #cccccc;
        }

        section#order #order1 h2 span {
            color: #80a727;
        }

        section#order #summary1 {
            float: left;
            margin: 50px 400px;
        }

        section#order #summary1 img {
            width: 550px;
            height: 600px;
        }

        section#order #summary2 {
            width: 380px;
            float: left; 
            margin: 20px -300px;           
        }

        section#order #summary2 .item {
            margin: 20px 0 0 20px;
            padding-bottom: 230px;
            border-bottom: solid 2px #cccccc;
        }        

        section#order #summary2 .item ul {
            list-style: none;
        }

        section#order #summary2 .item li {
            margin: 20px 0 0 0;            
        }

        section#order #summary2 .item li div {
            margin-top: 20px;
        }

        section#order #summary2 .col1 {
            width: 100px;
            float: left;
        }

        section#order #summary2 .col2 {
            width: 200px;
            float: left;
        }

        section#order #summary2 #buttons .buy:hover {
            background-color: rgb(53, 52, 52);
        }

        section#order #summary2 #buttons .cart:hover {
            color: rgb(128, 125, 125);
        }

        section#order #summary2 #buttons .buy {
            border-radius: 10px;
            border-color: white;
            padding: 30px 100px;
            font-size: 18px; 
            margin: 80px 0px 30px 50px;
            background-color: rgb(73, 72, 72);  
            color: white;  
        }

        section#order #summary2 #buttons .cart {
            border-radius: 10px;
            border-width: 1px;
            padding: 30px 80px;
            font-size: 18px;   
            margin-left: 50px;
            /* margin: 0 50px 50px 50px; */
            background-color: white;
            color: black;               
        }

        
       

    
        section#details details {
            text-align: center;        
        }

        section#details details summary {
            list-style: none;            
        }

        section#details details summary img {
            margin: 100px;
        }

        section#details div {
            text-align: center;            
        }

        section#details .details1 img {
           margin: 200px;
        }
        
        section#details .screenshot img {          
            width: 700px;
            height: 750px;
            margin: 50px;
        }
        section#details details summary:after{
           
           content: url("images/product_more_down.JPG");
           

       }
      
       
       section#details details[open] summary:after {
           content:url("images/product_more_up.JPG");
                      
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
        <c:forEach items="${detail}" var="detail">
      <section id="order">
        <section id="order1">
          <form name="orderform">
          <input type="hidden" name="userId" value="${userId}">
          <input type="hidden" name="pnum" value="${detail.PNum}">
            <section id="summary1">
                <div class="image">
                    <img src="images/${detail.pimage}/${detail.pimage}-0.JPG">
                </div>                
            </section>
            
            <section id="summary2">
                <h3>구찌</h3>
                
                <div class="item">
                    <ul>
                        <li>
                            <div class="col1" >가격</div>
                            <div class="col2"><input type="text" name="price" value="${detail.pprice}" readonly></div>
                            <div class="clear"></div>
                           
                        </li>
                        <li>
                            <div class="col1">브랜드</div>
                            <div class="col2">구찌</div>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <div class="col1">수량</div>
                            <div class="col2">
                                <input type="text" name="count" value="1">
                            </div>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <div class="col1">사이즈</div>
                            <div class="col2">
                                <select name="size">
                                    <option>===  선택  ===</option>
                                    <option value="250">250</option>
                                    <option value="260">260</option>
                                    <option value="270">270</option>
                                    <option value="280">280</option>                                  
                                </select>
                            </div>
                            <div class="clear"></div>
                        </li> <li>
                            <div class="col1">컬러</div>
                            <div class="col2">
                                <select name="color">
                                    <option>===  선택  ===</option>
                                    <option value="blue">blue</option>
                                    <option value="white">white</option>
                                    <option value="red">red</option>
                                    <option value="black">black</option>                                  
                                </select>
                            </div>
                            <div class="clear"></div>
                        </li>
                    </ul>                    
                </div> 
                   
                <div id="buttons">
                
                    <input type="button" value="구매하기" class="buy" onclick="order('buy')">
                    <input type="button" value="장바구니" class="cart" onclick="order('cart')">
                   
                </div>    
            </section>
           </form>
            <div class="clear"></div>
        </section>
    </section>
   			
    <section id="details">
        <details>
            <summary></summary>
            <div class="details1"><img src="images/detail.JPG"></div>
            <div class="screenshot"><img src="images/${detail.pimage}/${detail.pimage}-1.JPG"></div> 
            <div class="screenshot"><img src="images/${detail.pimage}/${detail.pimage}-2.JPG"></div> 
            <div class="screenshot"><img src="images/${detail.pimage}/${detail.pimage}-3.JPG"></div> 
            <div class="screenshot"><img src="images/${detail.pimage}/${detail.pimage}-4.JPG"></div> 
        </details>    
    </section>
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