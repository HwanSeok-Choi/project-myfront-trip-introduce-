<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>지역 행사 일정</title>
<link href="/day6/resources/css/event.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.month,
.area {
	display: inline-block;
	width: 100px;
	height: 100px;
	background-color: red;
	cursor: pointer;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div>
		<h2>행사 정보</h2>
		<div class="month" data-month="01">1월</div>
		<div class="month" data-month="02">2월</div>
		<div class="month" data-month="03">3월</div>
		<div class="month" data-month="04">4월</div>
		<div class="month" data-month="05">5월</div>
		<div class="month" data-month="06">6월</div>
		<div class="month" data-month="07">7월</div>
		<div class="month" data-month="08">8월</div>
		<div class="month" data-month="09">9월</div>
		<div class="month" data-month="10">10월</div>
		<div class="month" data-month="11">11월</div>
		<div class="month" data-month="12">12월</div>
	</div>

	<div>
		<div class="area" data-area="1">서울</div>
		<div class="area" data-area="2">인천</div>
		<div class="area" data-area="3">대전</div>
		<div class="area" data-area="4">대구</div>
		<div class="area" data-area="5">광주</div>
		<div class="area" data-area="6">부산</div>
		<div class="area" data-area="7">울산</div>
		<div class="area" data-area="8">세종특별시</div>
		<div class="area" data-area="9">경기도</div>
		<div class="area" data-area="10">강원도</div>
	</div>
	
<table id="eventTable">
    <thead>
        <tr>
            <th>제목</th>
            <th>사진</th>
            <th>주소</th>
            <th>날짜</th>
        </tr>
    </thead>
    <tbody id="eventTableBody">
        <c:forEach var="item" items="${list}">
            <tr>
                <td>${item.title}</td>
                <td><img src="${item.firstimage}"></td>
                <td>${item.addr1}${item.addr2}</td>
                <td>${item.eventstartdate}~ ${item.eventenddate}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<script>
$(document).ready(function() {
    // 초기 선택된 월과 지역 설정
    var selectedMonth = "";
    var selectedArea = "";

    // 월 클릭 이벤트
    $(".month").click(function() {
        var clickedMonth = $(this).data("month");
        if (selectedMonth === clickedMonth) {
            // 이미 선택된 월을 다시 클릭한 경우 선택 취소
            selectedMonth = "";
        } else {
            selectedMonth = clickedMonth;
        }
        var currentYear = new Date().getFullYear();
        window.location.href = "/day6/area?year=" + currentYear + "&month=" + selectedMonth + "&area=" + selectedArea;
    });

    // 지역 클릭 이벤트
    $(".area").click(function() {
        var clickedArea = $(this).data("area");
        if (selectedArea === clickedArea) {
            // 이미 선택된 지역을 다시 클릭한 경우 선택 취소
            selectedArea = "";
        } else {
            selectedArea = clickedArea;
        }
        var currentYear = new Date().getFullYear();
        window.location.href = "/day6/area?year=" + currentYear + "&month=" + selectedMonth + "&area=" + selectedArea;
    });

    // 초기화 함수 정의
    function resetSelection() {
        selectedMonth = "";
        selectedArea = "";
        $(".month").removeClass("selected");
        $(".area").removeClass("selected");
    }

    // 월 선택을 처리하는 부분
    $(".month").click(function() {
        resetSelection();
        $(this).toggleClass("selected");
    });

    // 지역 선택을 처리하는 부분
    $(".area").click(function() {
        resetSelection();
        $(this).toggleClass("selected");
    });
});
</script>
</body>
</html>