<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find User Info</title>
<script>
window.onload = function() {
    showIdSearch();
};

function showIdSearch() {
    document.getElementById("idSearch").style.display = "block";
    document.getElementById("pwSearch").style.display = "none";
}

function showPwSearch() {
    document.getElementById("idSearch").style.display = "none";
    document.getElementById("pwSearch").style.display = "block";
}
</script>
</head>
<body>
<h1>Find User Info</h1>
<button onclick="showIdSearch()">아이디 찾기</button>
<button onclick="showPwSearch()">비밀번호 찾기</button>

<form id="idSearch" action="/project/user/findMyId.do" method="post" style="display:none;">
    <table>
        <tr>
            <td>이름</td>
            <td><input id="userName" name="userName"></td>
        </tr>
        <tr>
            <td>전화번호</td>
            <td><input id="userTel" name="userTel"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="제출">
                <c:if test="${not empty errorMessage}">
                    <p style="color: red;">${errorMessage}</p>
                </c:if>
            </td>
        </tr>
    </table>
</form>

<form id="pwSearch" action="/project/user/findMyPw.do" method="post" style="display:none;">
    <table>
        <tr>
            <td>아이디</td>
            <td><input id="userId" name="userId"></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input id="userName" name="userName"></td>
        </tr>
        <tr>
            <td>전화번호</td>
            <td><input id="userTel" name="userTel"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="제출">
                <!-- 입력이 잘못된 경우 오류 메시지를 표시 -->
                <c:if test="${not empty errorMessage}">
                    <p style="color: red;">${errorMessage}</p>
                </c:if>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
