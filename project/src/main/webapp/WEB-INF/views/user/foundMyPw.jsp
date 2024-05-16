<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<script>
    function checkPassword() {
        var newPassword = document.getElementById("new_password").value;
        var confirmPassword = document.getElementById("confirm_password").value;
        var submitButton = document.getElementById("submit_button");
        var message = document.getElementById("message");

        if (newPassword !== confirmPassword) {
            submitButton.disabled = true;
            message.innerText = "비밀번호가 일치하지 않습니다.";
        } else {
            submitButton.disabled = false;
            message.innerText = "";
        }
    }
</script>
</head>
<body>
    <form action="/project/user/updateMyPw.do" method="post">
    	<input type="hidden" id="userId" name="userId" value="${userId}">
        <label for="new_password">새 비밀번호:</label>
        <input type="password" id="new_password" name="newPw" required><br>
        
        <label for="confirm_password">비밀번호 확인:</label>
        <input type="password" id="confirm_password" name="confirmPw" oninput="checkPassword()" required>
        <span id="message" style="color: red;"></span><br>
        
        <button type="submit" id="submit_button">비밀번호 변경</button>
    </form>
</body>
</html>
