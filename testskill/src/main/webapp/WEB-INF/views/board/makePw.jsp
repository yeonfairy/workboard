<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<table id = "pwChkOk">
		<tr>
			<td>비밀번호 : </td>
			<td><input type = "password" id = "pw"> </td>
			<td rowspan = "2"><input type = "button" value = "저장" id = "pwComplete" style = "height : 50px;"></td>
		</tr>
		<tr>
			<td>비밀번호 재입력: </td>
			<td><input type = "password" id = "pwRe"> </td>
		</tr>
	</table>
</body>
<script>

var board_id = ${board_id};
$('#pwComplete').click(function(){
	var pw = $('#pw').val();
	var pwRe = $('#pwRe').val();
	
	if(pw == pwRe){
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/board/update',
			data : {
				password : pw,
				board_id : board_id
			},
			success : function(data){
				opener.location.href = '${pageContext.request.contextPath}/board/list';
				window.close();
			}
		});
	} else {
		alert("비밀번호가 다릅니다");
	}
});
</script>
</html>