<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <title>Insert title here</title>
<%-- <%@ include file="../include/header.jsp" %> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#btnLogin").click(function(){
 			userId=$("#userId").val();
 			var userPw=$("#userPw").val(); 
 			if(userId == ""){
  				alert("아이디를 입력하세요");
  				$("#userId").focus();

			  return;
			}
			if(userPw==""){
 				alert("비밀번호를 입력하세요"); 
 				$("#userPw").focus();
  				return;
			}

 			document.form1.action= "${path}/user/login_check.do";
 			document.form1.submit();
		});
	});
</script>
</head>

<body>
	<h2>로그인</h2>
	<form name="form1" method="post">
		<table border="1" width="400px">
			<tr>
 				<td>아이디</td>
 				<td><input id="userId" name="userId"></td>
			</tr>
			<tr>
 				<td>비밀번호</td>
 				<td><input type="password" id="userPw" name="userPw"></td>
			</tr>
			<tr>
 				<td colspan="2" align="center">
 					<button type="button" id="btnLogin">로그인 </button>
 					<c:if test="${message == 'error'}">
 						<div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.</div>
					</c:if>
					<c:if test="${message == 'logout'}">
 						<div style="color:red;"> 로그아웃되었습니다.</div>
					</c:if>
				</td>
			</tr>
		</table>
	</form>


	<table>
		<tr>
			<td><a href="/project/user/findMyInfo.do">아이디/비밀번호 찾기</a></td>
		</tr>
	</table>
</body>
</html>