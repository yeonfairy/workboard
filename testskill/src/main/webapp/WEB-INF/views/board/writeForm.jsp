<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	body {
		width : 800px;
		text-align : center;
	}
</style>
</head>
<body>
<h1>글쓰기</h1>
<form class = "writeForm" method = "post">
	<div>제목 <input type = "text" name = "title" style = "width : 723px;"required></div> <hr>
	<div>내용 <textarea rows = "20" cols = "100" name = "con" style = "border-bottom : 1px solid black" required></textarea></div><hr>
	<div style = "border-bottom : 1px solid blue; padding-left : 80%; "><input type = "button" id = "goPassword" value = "비밀번호 설정">
		<input type = "text" id = "isPW" value = "N" style = "border : none; width : 10px;" readonly></div>
	<input type = "hidden" id = "password" name = "password">
	<input type = "hidden" id = "writer" name = "writer" value = "${userSession }">
	<button type = "submit">저장</button> <input type = "button" id = "cancle" value = "취소">
</form>

</body>
<script>
	window.name = "writeForm"
	$(document).ready(function(){
	});
	$('#goPassword').click(function(){
		window.open('makePwInWrite','window팝업','width = 600, height = 200');
	});
	
	$('#cancle').click(function(){
		location.href = '${pageContext.request.contextPath}/board/list';
	});
	
	
</script>
</html>