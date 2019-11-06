<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>

	table, tr, td {
		border : 1px solid black;
		text-align : center;
	}

</style>
</head>

<body>
<form action = "${pageContext.request.contextPath}/board" method = "POST">
	<table>
	<tr>
		<td>ID</td>
		<td><input type = "text" id = "user_id" name = "user_id" value = "${cookie.remember_id.value}" required></td>
		<td rowspan = "3"><button type = "submit" id = "loginBtn" style = "height : 75px;">로그인</button></td>
	</tr>
	<tr>
		<td>PW</td>
		<td><input type = "password" id = "password" name = "password" required></td>
	</tr>
	<tr>
		<td colspan = "2">로그인유지<input type = "checkBox" id = "remember_id" name = "remember_id" ${checked}></td>
	</tr>
	</table>
</form>
</body>

 <!-- <script>
		$('#loginBtn').click(function(){
			var id = $('#inputId').val();
			var pw = $('#inputPw').val();
			var tmp = $('#remember_id').is(':checked');
			if(id == null || pw == null){
				alert("아이디 혹은 비밀번호를 입력해주세요");
			} else {
				$.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath}/',
					data : {
						user_id : id,
						remember_id : tmp
					},
					success : function(data){
						console.log(data)
						if(data != pw){
							alert("아이디 혹은 비밀번호가 일치하지 않습니다");
						} else {
							location.href = '${pageContext.request.contextPath}/board/list';
						}
					}
				});
			}
		});
</script> -->
</html>



