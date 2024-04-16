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
position: absolute;
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
<h3 class="H3">점포판매현황</h3>
    <section class="Sec">
        <div>
            <table border=1>
  				<tr>
  					<th>점포코드를 입력 하시오.</th>
  					<td><input type="text"></td>
  				</tr>
  				
  				<tr>
  					<td colspan="2"><input type="submit" value="조회"></td>
  				</tr>
            </table>
        </div>
    </section>
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>