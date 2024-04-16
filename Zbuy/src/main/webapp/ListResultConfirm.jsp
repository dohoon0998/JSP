<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.A {
position: absolute;ㅁ
top: 800px;
left: 47%;
}

.HH {
position: absolute;
top: 180px;
left: 33%;
}
</style>
</head>
<jsp:include page="Header.jsp"></jsp:include>
<body>
<h3 class="H3">A001 의 점포판매현황</h3>
    <section class="Sec">
        <div>
            <table border=1>
                <tr>
                    <th>점포코드</th>
                    <th>점포명</th>
                    <th>직영구분</th>
                    <th>카드매출</th>    
                    <th>현금매출</th>    
                    <th>총 판매수량</th>       
                </tr>
                
                <tr>
                	<td>A001</td>
                	<td>이태원점</td>
                	<td>직영</td>
                	<td>0원</td>
                	<td>8,000원</td>
                	<td>8,000원</td>
                </tr>
            </table>
        </div>
            <input type="submit" value="돌아가기" style="position: absolute; top: 250px; left: 48%;">
    </section>
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>