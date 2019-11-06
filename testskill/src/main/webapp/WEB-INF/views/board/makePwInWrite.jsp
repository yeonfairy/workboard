<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	table, tr, td{
		border : 1px solid black;
		text-align : center;
	}
</style>
</head>
<body>
<table id = "pwTable" style = "">
	<tr>
		<td>비밀번호: </td>
		<td><input type = "password" id = "inputPw" required></td>
		<td><input type = "submit" id = "pwOk" value = "확인" onclick = "popup()"></td>
	</tr>
</table>
</body>
<script>
function popup(){
	var password = $('#inputPw').val();
	if($('#inputPw').val() != ""){
		opener.document.getElementById("password").value = document.getElementById("inputPw").value;
		opener.document.getElementById("isPW").value = "Y";
		//opener.location.href = '${pageContext.request.contextPath}/board/writeForm?password = ' + password;
		window.close();
	} else {
		alert("비밀번호를 입력하세요");
	}
}


</script>
</html>