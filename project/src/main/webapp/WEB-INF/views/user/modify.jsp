<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify Info</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
$( function() {
    $( "#userBirth" ).datepicker({
        dateFormat: 'yy-mm-dd'
    });
});


    $(document).ready(function() {
        $("#nickname").on('input', function() {
            var currentNickname = "${user.nickname}";
            var newNickname = $(this).val();
            
            if (currentNickname !== newNickname) {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/user/check_nickname.do",
                    data: {nickname: newNickname},
                    success: function(data) {
                        if (data == "duplicate") {
                            $("#nicknameCheckMsg").text("이미 사용 중인 닉네임입니다.");
                            $("#submitBtn").prop("disabled", true);
                        } else {
                            $("#nicknameCheckMsg").text("");
                            $("#submitBtn").prop("disabled", false);
                        }
                    }
                });
            }
        });
    });



</script>
</head>
<body>
<h2>Modify Info</h2>
<form action="${pageContext.request.contextPath}/user/modify_process.do" method="post">
    <table>
    	
            
        
        <tr>
            <td>ID</td>
            <td><input type="text" name="userId" value="${user.userId}" readonly></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="userName" value="${user.userName}" required></td>
        </tr>
        <tr>
            <td>Nickname</td>
            <td><input type="text" name="nickname" id="nickname" value="${user.nickname}" required></td>
            <td><span id="nicknameCheckMsg" style="color:red;"></span></td>
        </tr>
        <tr>
		    <td>BIRTH</td>
		    <td>
		        <input type="text" id="userBirth" name="userBirth" value='<fmt:formatDate value="${user.userBirth}" pattern="yyyy-MM-dd"/>'/>
		    </td>
		</tr>

        
        <tr>
            <td>Password</td>
            <td><input type="password" name="userPw" value="${user.userPw}" required></td>
        </tr>
        <tr>
            <td>Telephone</td>
            <td><input type="text" name="userTel" value="${user.userTel}" required></td>
        </tr>
        <tr>
            <td colspan="2"><input id="submitBtn" type="submit" value="수정하기"></td>
        </tr>
    </table>
</form>
</body>
</html>
