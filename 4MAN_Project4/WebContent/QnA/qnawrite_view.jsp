<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    function qnawrite(x){
    	var writeform=document.wirteform;
    	if(x=='insert'){
    		writeform.method="get";
    		writeform.action="qnawrite.do";
    		
    	}else if(x=='list'){
    		writeform.action="qnalist.do";
    	}
    	writeform.submit();
    }
		
	
	</script>
    <style>
           #QnA_write{
            margin-top: 30px;
            width: 1100px;
            
           
        }
        #QnA_write table{
            width: 1000px;
            border-top: 3px solid black;
            border-collapse: separate;
            border-spacing: 0 15px;
        }
        #QnA_write table th{
            text-align: left;
            width: 1000px;
            height: 50px;
           
        }
        #QnA_write table td{
            padding-bottom: 10px;
            width: 1000px;
            height: 50px;
            border-bottom: 2px solid gray;
           
        }
        #QnA_write table td input{
            text-align: left;
            width: 1000px;
            height: 50px;
            
        }
        #QnA_write table td textarea{
            text-align: left;
            width: 1000px;
            height: 600px;
           
        }
      #writeBtn{
            width: 1000px;
            margin-top: 10px;
          
            
        }
        #writeBtn input{
            margin-right: 5px;
           float: right;
           background-color: white;
           border: 1px solid gray;
           width: 100px;
        }
        #writeBtn input:hover{
          
            border:1px solid rgb(0, 225, 255);
            color: rgb(0, 225, 255);
          
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
        <form name="wirteform">
        <div id="QnA_write">
                <h2>게시판 글 정보</h2>
                <table>
                    <tr>
                      <th>아이디</th>
                    </tr>
                    <tr>
                        <td><input type="text" name="userid" value="${userId }" readonly></td>
                    </tr>
                    <tr>
                        <th>제 목</th>
                      </tr>
                    <tr>

                          <td><input type="text" name="btitle" value="제목을 입력하세요"></td>
                    </tr>
                    <tr>
                        <th>내 용</th>
                      </tr>
                    <tr>
                          <td><textarea name="bcontent" value="" ></textarea></td>
                    </tr>
                </table>
            </div>
            <div id="writeBtn">
                <input type="button"  value="등록" onclick="qnawrite('insert')">
                <input type="button"  value="목록" onclick="qnawrite('list')">
            </div>
        </form>
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
