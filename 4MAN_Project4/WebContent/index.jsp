<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	</script>
    <style>
        #slide{
        width: 1400px;
        height: 600px;
        background-color:blue;
        position:relative;
   
    }
    #slide img {
        float:left;
    }
    #menu{
        margin-top: 100px;
        width: 1400px;
        height: 200px;
        
    }
    #menu ul{
    
        list-style: none;
        
    }
    #menu ul li{
        font-weight: bold;
        font-size: 1cm;
        margin-top: 60px;
        float: left;
        margin-left: 10%;


    }
    #menu ul li a{
    text-decoration: none;
    color: black;
    }
    #mainItem{
        margin-top: 150px;
        width: 1400px;
        height: 1300px;
        
    }
    #mainItem .ProductList{
        display: inline-block;
         margin-left: 10px;
         margin-right:10px;
      
          margin-top: 80px;
          width:300px;
          height:500px;
          text-align: center;
    }
    #mainItem h1{
        font-size: 0.5cm;
        font-weight: bold;
    }
    #mainItem h1::after{
        content: "";
        display: block;
        width: 20px;
        border-bottom: 2px solid black;
        margin: 10px auto;
    }
    #mainItem .ProductList img{
        width:300px;
          height:400px;
        margin-bottom: 10px;
    }
    #mainItem .ProductList p{
        width:200px;
        margin-top: 10px;
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
                   <form name="searchform">
                    <div class="search">
                        <div>
                          <input type="text"   id="searchId" name="searchname" placeholder="Search . . ." required onclick="searchClick()">
                        </div>
                      </div>
                      </form>
                </div>
                <div class="nav_icon">
                    <a href="javascript:void(0)" onclick="cart(this)"> <img src="images/cart.png"></a>
                </div>
            </div>
        </div>
        
        <div id="blink">
          
        </div>
        <div id="slide">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="images/slide_image1.jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="images/slide_image2.jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="images/slide_image3.jpg" class="d-block w-100" alt="...">
                  </div>
                </div>
        </div>
        <div id="menu">
            <ol>
                <ul>
                    <li><a href="best_product.do">Best</a></li>
                    <li><a href="new_product.do">New</a></li>
                    <li><a href="top_product.do">Top</a></li>
                    <li><a href="pants_product.do">Pants</a></li>
                    <li><a href="shoes_product.do">Shoes</a></li>
                </ul>
            </ol>
        </div>
        <div id="mainItem">
                <h1>BEST</h1>
                 <c:forEach items="${best}" var="best">
            <div class="ProductList">
                <a href="detail_product.do?Pnum=${best.PNum }"><img src="images/${best.pimage }/${best.pimage }-0.JPG"></a></li>
                <p>${best.pname }</p>
                <p>${best.pprice }원</p>
            
            </div>
            </c:forEach>
            <div class="ProductList">
                <a href="detail_product.html"><img src="images/slide_image1.jpg"></a>
                <p>상품 이름</p>
                <p>상품 가격</p>
            
            </div><div class="ProductList">
                <a href="detail_product.html"><img src="images/slide_image1.jpg"></a>
                <p>상품 이름</p>
                <p>상품 가격</p>
            
            </div><div class="ProductList">
                <a href="detail_product.html"><img src="images/slide_image1.jpg"></a>
                <p>상품 이름</p>
                <p>상품 가격</p>
            
            </div><div class="ProductList">
                <a href="detail_product.html"><img src="images/slide_image1.jpg"></a>
                <p>상품 이름</p>
                <p>상품 가격</p>
            
            </div><div class="ProductList">
                <a href="detail_product.html"><img src="images/slide_image1.jpg"></a>
                <p>상품 이름</p>
                <p>상품 가격</p>
            
            </div><div class="ProductList">
                <a href="detail_product.html"><img src="images/slide_image1.jpg"></a>
                <p>상품 이름</p>
                <p>상품 가격</p>
            
            </div>
            <div class="ProductList">
                <a href="detail_product.html"><img src="images/slide_image1.jpg"></a>
                <p>상품 이름</p>
                <p>상품 가격</p>
            
            </div>
          
        </div> 
        <div id="mainItem">
            <h1>NEW</h1>
                  <c:forEach items="${New}" var="New">
            <div class="ProductList">
                <a href="detail_product.do?Pnum=${New.PNum }"><img src="images/${New.pimage }/${New.pimage }-0.JPG"></a></li>
                <p>${New.pname }</p>
                <p>${New.pprice }원</p>
            
            </div>
            </c:forEach>
            <div class="ProductList">
                <a href="detail_product.html"><img src="images/slide_image1.jpg"></a>
                <p>상품 이름</p>
                <p>상품 가격</p>
            
            </div><div class="ProductList">
                <a href="detail_product.html"><img src="images/slide_image1.jpg"></a>
                <p>상품 이름</p>
                <p>상품 가격</p>
            
            </div><div class="ProductList">
                <a href="detail_product.html"><img src="images/slide_image1.jpg"></a>
                <p>상품 이름</p>
                <p>상품 가격</p>
            
            </div><div class="ProductList">
                <a href="detail_product.html"><img src="images/slide_image1.jpg"></a>
                <p>상품 이름</p>
                <p>상품 가격</p>
            
            </div><div class="ProductList">
                <a href="detail_product.html"><img src="images/slide_image1.jpg"></a>
                <p>상품 이름</p>
                <p>상품 가격</p>
            
            </div><div class="ProductList">
                <a href="detail_product.html"><img src="images/slide_image1.jpg"></a>
                <p>상품 이름</p>
                <p>상품 가격</p>
            
            </div>
            <div class="ProductList">
                <a href="detail_product.html"><img src="images/slide_image1.jpg"></a>
                <p>상품 이름</p>
                <p>상품 가격</p>
            
            </div>
      
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
					 <c:if test="${userId eq 'admin'}"> 
						<a href="admin.do"style="color: black">관리자 모드</a>
					</c:if>
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
