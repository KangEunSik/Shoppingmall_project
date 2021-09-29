<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.fourman.dao.UserDao"%>
<!DOCTYPE html>
<html>
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
     .loginbox{
            
            width: 600px;
            height: 500px;
            
            box-sizing: border-box;
            margin-top: 200px;
        }

        .h1{
            margin-top: 50px;
            font-size: 80px;
        }
        
        #loginid,#loginpw{
            width: 200px;
            height: 40px;
            border: 1px solid #999;
            box-sizing: border-box;
            margin-bottom: 10px;
            text-align: left;
        }

        .labelid{
            font-size: 16px;
            color: #666;
            margin: 0 auto;
            margin-right: 8px;
        }

        .labelpw{
            font-size: 16px;
            color: #666;
            margin: 0 auto;
           
        }

        .chk{
            width: 100%;
            text-align: right;
            padding-right: 30px;
            box-sizing: border-box;
        }

        .chk label{
            font-size: 12px;
            color: #999;
            position: relative;
            top: -3px;
        }

        .search{
            width: 100%;
            height: 40px;
            box-sizing: border-box;
            line-height: 40px;
            text-align: center;
            margin-bottom: 20px;
        }

        .search span{
            font-size: 11px;
            color: #999;
        }

        .search a{
            font-size: 12px;
            text-decoration: none;
            background-color: #333;
            color: #fff;
            padding: 3px 5px;
            border-radius: 3px;
            margin-left: 5px;
        }

        .btnwrap{
            width: 100%;
            text-align: center;
        }

        .btnwrap label{
            position:absolute;
            left: -999em;
        }
        .btnwrap a{
            width: 150px;
            height: 50px;
            background-color: #999;
            text-decoration: none;
            display: inline-block;
            border-radius: 3px;
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            line-height: 45px;
            top: 1px;
        }

        #loginbtn{
            width: 150px;
            height: 50px;
            border: none;
            background-color: #ff9900;
            border-radius: 3px;
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            position: relative;
            top: 3px;
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
        
        <form action="loginAction.do" method="post">
            <div class="loginbox">
                <h1 class="h1">LogIn</h1><br>
                <label for="loginid" class="labelid"><b>ID</b></label>
                <input type="text" id="loginid" name="userid"><br>
                <label for="loginpw" class="labelpw"><b>PW</b></label>
                <input type="password" id="loginpw" name="userpw"><br>
                <div class="chk">
                    <input type="checkbox" name="idchk">
                    <label for="idchk">ID 저장</label>
                    <input type="checkbox" name="pwchk">
                    <label for="idchk">PASSWORD 저장</label>
                </div>
                <div>
                    <div class="search">
                        <span class="text">ID/PW를 잊어버리셨나요?</span>
                        <a href="find_id.do">ID/PW찾기</a>
                    </div>
                    <div class="btnwrap">
                        <a href="join.do">회원가입</a>
                        <input type="submit" id="loginbtn" value="로그인">
                        <label for="loginbtn">로그인버튼</label>
                    </div>
                </div>
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