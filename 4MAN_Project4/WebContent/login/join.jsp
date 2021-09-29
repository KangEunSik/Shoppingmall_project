<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
   
    
    function checkValue(){
    	if(!document.userInfo.name.value){
    		alert("이름을 입력하세요.");
    		return false;
    	}
    	if(!document.userInfo.id.value){
    		alert("아이디를 입력하세요.");
    		return false;
    	}
    	if(!document.userInfo.pwd.value){
    		alert("비밀번호를 입력하세요.");
    		return false;
    	}
    	if(document.userInfo.pwd.value!=document.userInfo.pwdCheck.value){
    		alert("비밀번호를 동일하게 입력하세요.");
    		return false;
    	}
    	if(!document.userInfo.mailid.value){
    		if(!document.userInfo.email.value){
    			alert("이메일을 입력하세요.");  			
    			return false;
    		}
    	}
    	if(!document.userInfo.phone.value){
    		if(!document.userInfo.pn2.value){
    			if(!document.userInfo.pn3.value){
    			alert("휴대폰번호를 입력하세요.");
    			return false;
    			}	
    		}
    	}	
    	if(!document.userInfo.address.value){
    		alert("주소를 입력하세요.");
    		return false;
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
	function findAddress(){
		 new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                  
	                
	                } else {
	                    
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                
	                document.getElementById("address1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("address2").focus();
	            }
	        }).open();
		}
	function idcheck(){
		var idcheck=document.getElementById("id").value;
		location.href="idcheckAction.do?id=idcheck";
		
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
    height: 450px;
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
        <form method="post" action="insert_userDB.do" name="userInfo" onsubmit="return checkValue()">


            <div>
                <div>
                    <table id="form">
                    <h2 id="h2"><b>회원가입</b></h2>
          <tr>
              <td class="col1">이름</td>
              <td class="col2"><input type="text" name="name" style="text-align: left;" maxlength="5"></td>
          </tr>
          <tr>
              <td class="col1">아이디</td>
              <td class="col2">
                  <input type="text" name="id" id="id" maxlength="15" style="text-align: left;">
                  <input class='but1' type="button" value="중복 확인" onclick="idcheck()">
              </td>
          </tr>
          <tr>
              <td class="col1">비밀번호</td>
              <td class="col2">
                  <input type="password" name="pwd" maxlength="16" style="text-align: left;">
              </td>
          </tr>
          <tr>
              <td class="col1">비밀번호 확인</td>
              <td class="col2"><input type="password" placeholder="비밀번호 확인" name="pwdCheck" maxlength="16" style="text-align: left;"></td>
          </tr>
          <tr>
              <td class="col1">이메일</td>
              <td class="col2">
                  <input type="text" name="mailid" style="text-align: left;">
                  <span class="a">@</span>
                  <input type="text" name="email" value="" style="text-align: left;">
                  <select name="domain" id="domain" onchange="this.form.email.value=this[this.selectedIndex].value">
                      <option value="직접입력" selected>직접입력</option>
                      <option value="naver.com">naver.com</option>
                      <option value="gmail.com">gmail.com</option>
                      <option value="daum.net">daum.com</option>
                      <option value="nate.com">nate.com</option>
                  </select>
              </td>
          </tr>
          <tr>
              <td class="col1">전화번호</td>
              <td class="col2">
                <select name="phone">
                    <option value="select" selected>선택</option>
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                </select>
                -
                <input type="text" name="pn2" placeholder="XXXX" style="width: 50px; text-align: left;"  maxlength="4">
                -
                <input type="text" name="pn3" placeholder="XXXX" style="width: 50px; text-align: left"  maxlength="4">                  
              </td>
       
          </tr>
          <tr>
              <td class="col1">주소</td>
              <td class="col2">
                <input type="text" id="address1" name="address1"  maxlength="20" style="text-align: left;" placeholder="주소">
                <input type="text" id="address2" name="address2"  maxlength="20" style="text-align: left;" placeholder="상세주소">
                <input class='but2' type="button" value="주소 찾기" onclick="findAddress()">
              </td>
          </tr>
          </table>
          
        </div>
       
        <div class="create">
          
              <input class="but3" type="button" value="가입취소" onclick="location.href='index.do'">
              <input class="but4" type="submit" value="회원가입" onclick="">
          
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