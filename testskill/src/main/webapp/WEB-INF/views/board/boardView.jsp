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
	table, tr, td {
		border : 1px solid black;
	}
</style>
</head>
<body>
<table>
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>조회수</td>
	</tr>
	<tr>
		<td>${boardVo.board_id}</td>
		<td>${boardVo.title}</td>
		<td>${boardVo.writer}</td>
		<td>${boardVo.view_cnt}</td>
	</tr>
	<tr>
		<td colspan = "4"><textarea>${boardVo.con}</textarea></td>
	</tr>
</table>
	<input type = "button" id = "pwChk" value = "비밀번호 설정">
	
</body>
<script>
var board_id = ${boardVo.board_id};
	$(document).ready(function(){
	});
	
	$('#pwChk').click(function(){
		window.open('makePw?board_id=' + board_id,'window팝업','width = 600, height = 200');
	});
	
	
</script>
</html>