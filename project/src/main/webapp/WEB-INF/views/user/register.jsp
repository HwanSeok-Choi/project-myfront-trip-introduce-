<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    $(document).ready(function() {
        $("#userId").on('input', function() {
            var userId = $(this).val();
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/user/check_id.do",
                data: {userId: userId},
                success: function(data) {
                    if (data == "duplicate") {
                        $("#idCheckMsg").text("이미 사용 중인 아이디입니다.");
                        $("#registerBtn").prop("disabled", true);
                    } else {
                        $("#idCheckMsg").text("");
                        $("#registerBtn").prop("disabled", false);
                    }
                }
            });
        });
    });
</script>

</head>
<body>
    <h2>회원가입</h2>
    <form action="${pageContext.request.contextPath}/user/register_process.do" method="post">
        <table>
            <tr>
                <td>ID</td>
                <td><input type="text" name="userId" id="userId" required></td>
                <td><span id="idCheckMsg" style="color:red;"></span></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="userPw" required></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="userName" required></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input type="text" name="userTel" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" id="registerBtn" value="가입하기"></td>
            </tr>
        </table>
    </form>
</body>
</html>