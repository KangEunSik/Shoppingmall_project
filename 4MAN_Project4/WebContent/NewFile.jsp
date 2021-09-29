<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
        function click(){
            var a=document.getElementsByName("a").value;
            
                alert(a);
            
        }
    </script>
</head>
<body>
    <div>
        <form>
        <input type="text" id="a" name="a">
        <input type="button" value="확인" onclick="click()">
    </form>    
    </div>
</body>
</html>

 
