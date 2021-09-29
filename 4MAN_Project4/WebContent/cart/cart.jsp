<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.fourman.dao.UserDao" %>
<%@ page import="com.fourman.dto.CartListDto" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 내역</title>
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script type="text/javascript">
   	 function cart(choice){
   		var theForm= document.cartform;
   			if(choice=='buy'){
   				theForm.method="get";
   				theForm.action="order_productAction.do";
   			}
   			else if(choice='detele'){
   				theForm.method="get";
   				theForm.action="cartDelete.do";
   			}
    		
    		theForm.submit();
   		
    }
    </script>
    
    <style>
    	
    
    
    
    
      #mypage_menu{
          margin-top: 100px;
          width: 1400px;
          height: auto;
         
                 
      }
      #mypage_menu table{
        
        border-spacing: 10px;
        border-collapse: separate;
      }
      #mypage_menu table td{
          font-weight: bold;
          font-size: 0.7cm;
          width: 250px;
          border-right: 1px solid black;
      }
      #mypage_menu a{
        text-decoration-line: none;
         
          color: black;
      }
      #mypage_title{
          margin-top: 50px;
          margin-bottom: 50px;
      }
      #mypage_order{
          width: 1400px;
          height: auto;
          
      }
      #mypage_order table td{
          font-weight: bolder;
          width: 200px;
          border-right: 1px solid black;
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
                   
                  
                   	 
                </div>
                   <div class="nav_icon">
                    <div class="search">
                        <div>
                          <input type="text" placeholder="Search . . ." required>
                        </div>
                      </div>
                </div>
                <div class="nav_icon">
                    <a href="#"> <img src="images/cart.png"></a>
                </div>
            </div>
        </div>
        
        <div id="blink">
          
        </div>
        <div id="mypage_menu">
               
            <table>
                <tr>
                 <td>
                        <a href="order_product.do?userId=${userId }">주문 내역</a>
                    </td>
                    <td>
                        <a href="cart.do?userId=${userId }">장바구니</a>
                    </td>
                    <td>
                        <a href="user_update.do?userId=${userId }">회원 정보 변경</a>
                    </td>
                    <td>
						<a href="mypage_userDelete.do">회원 탈퇴</a>
					</td>
                    <td>
                        <a href="qnauser_view.do?userId=${userId }"> QnA</a>
                    </td>
                </tr>
                
            </table>
        </div>
        <div id="mypage_title">
            <h2>장바 구니</h2>
        </div>
        
        <div id="mypage_order">
         <form name="cartform">
            <table>
                <tr>
                    <td bgcolor="#EBF7FF">
                       장바구니 번호
                    </td>
                    <td bgcolor="#EBF7FF">
                        상품명
                    </td>
                    <td bgcolor="#EBF7FF">
                         수량     
                    </td>
                          <td bgcolor="#EBF7FF">
                         가격     
                    </td>
                    <td bgcolor="#EBF7FF">
                        사이즈
                    </td>
                    <td bgcolor="#EBF7FF">
                        컬러
                    </td>
                   <td bgcolor="#EBF7FF">
                        주문관리 
                    </td>
          
                   
                </tr>
                 <c:forEach items="${cartList}" var="cartList">
           
                   <tr>
                    <td>
                        <input type="hidden" name="userId" value="${userId}">${cartList.cartnum }
                    </td>
                    <td>
                       <input type="hidden" name="pnum" value="${cartList.pnum}">	${cartList.pname }
                       	<img src="images/${cartList.pimage }/${cartList.pimage }-0.JPG" width="100px" height="100px">
                    </td>
                      <td>
                     <input type="hidden" name="count" value="${cartList.ordercount}">	${cartList.ordercount }
                    </td>
                  		 <td>
                     <input type="hidden" name="price" value="${cartList.cartprice}">	${cartList.cartprice}
                    </td>
                    <td>
                      <input type="hidden" name="size" value="${cartList.psize}"> 	${cartList.psize }
                    </td>
                    <td>
                       <input type="hidden" name="color" value="${cartList.pcolor}"> ${cartList.pcolor }
                    </td>
                     <td>
                       <input type="button"  value="삭제" onclick="cart('delete')" > <input type="button" value="구매" onclick="cart('buy')" >
                    </td>
                </tr>
             
                </c:forEach>
              
            </table>
            </form>
        </div>
        <div id="footer">
            <div class="footer_content">
                <ul>
                    <li>
                        <h4>CUSTOMER CENTER</h1>
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
                        <h4>Bank Info</h1>
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
                        <h4>COMPANY INFO</h1>
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