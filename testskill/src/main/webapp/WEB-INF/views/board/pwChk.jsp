<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
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
		<td>비밀번호 : </td>
		<td><input type = "password" id = "pwInput"></td>
		<td><input type = "button" value = "확인" onclick = "pwChk(${board_id},${view_cnt})"></td>
	</tr>
</table>
</body>
<script>
$(document).ready(function(){
	if($("#auth").text() == "[ROLE_USER]"){
		alert("접근권한이 없습니다.");
		window.close();
	}
});

	function pwChk(board_id, view_cnt){
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/board/pwChk',
			data : {
				board_id : board_id,
				password : $('#pwInput').val()
			},
			success : function(data){
				console.log(data);
				if(data == "1"){
					$.ajax({
						url : '${pageContext.request.contextPath}/board/viewCnt',
						data : {
							board_id : board_id,
							view_cnt : view_cnt,
							password : $('#pwInput').val()
						},
						success : function(data){
							console.log(data);
							opener.location.href = "boardView/" + board_id;
							window.close();
						}
					}); // 조회수 ajax 끝
				} else if (data == "2") {
					alert("비밀번호가 틀렸습니다.");
					opener.location.href = "list";
					window.close();
				}
			}
		})
	}
</script>
</html>