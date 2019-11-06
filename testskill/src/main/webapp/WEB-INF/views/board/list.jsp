<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
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
	table, tr, td{
		border : 1px solid black;
		text-align : center;
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
	
	<c:forEach var = "list" items = "${boardList}">
		<tr>
		<td>${list.board_id}</td>
		<td style = "cursor: pointer; width : 200px;" onclick = "pwChk(${list.board_id}, ${list.view_cnt}, '${list.password}')">${list.title}</td>
		<td>${list.writer}</td>
		<td>${list.view_cnt}</td>
		<tr>
	</c:forEach>
</table>
	<button id = "writeBnt">글쓰기</button>
</body>

<script>
	$('#writeBnt').click(function(){
		location.href = '${pageContext.request.contextPath}/board/writeForm';
	});
	
	function pwChk(board_id, view_cnt, password){
		
		if(password != ""){
			window.open('pwChk?board_id=' + board_id + '&view_cnt=' + view_cnt,'window팝업','width = 600, height = 200');
		} else {
			$.ajax({
				url : '${pageContext.request.contextPath}/board/viewCnt',
				data : {
					board_id : board_id,
					view_cnt : view_cnt,
					password : password
				},
				success : function(){
					location.href = '${pageContext.request.contextPath}/board/boardView/' + board_id;
				}
			});
		}
		
	}
</script>
</html>