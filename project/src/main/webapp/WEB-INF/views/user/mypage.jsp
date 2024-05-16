<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title> 
</head>
<body>
<c:if test="${not empty user}">
${user.nickname}님은 포인트 ${user.userPoint}점 갖고 있긔<br>
	<a href="/project/point/showMyPoint.do">포인트 내역</a>
    <a href="/project/user/modifyInfo.do">내 정보 변경</a>
    <a href="/project/user/deleteInfo.do">회원 탈퇴</a>
    
</c:if>
</body>
</html>
