<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title> 
</head>
<body>
</P>
home
<c:if test="${empty user}">
    <a href="user/login.do">로그인</a>
    <a href="user/register.do">회원가입</a>
</c:if>
<c:if test="${not empty user}">
    <a href="/project/user/logout.do">로그아웃</a>
    <a href="/project/user/mypage.do">마이페이지</a>
    ${user.nickname}님
    
</c:if>


  
</body>
</html>
