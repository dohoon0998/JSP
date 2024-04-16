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
top: 244px;
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
<%
request.setCharacterEncoding("UTF-8");
String resvno = request.getParameter("resvno");
boolean b = false;
%>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

String sql = "";


PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

rs.next();		
%>
<h3 class="H3">사원번호 : <%= rs.getString(1) %>님의 좌석예약조회</h3>
    <section class="Sec">
        <div>
            <table border=1>
                <tr>
                    <th>사원번호</th>
                    <th>이름</th>
                    <th>근무일자</th>
                    <th>좌석번호</th>    
                    <th>좌석위치</th>    
                    <th>내선번호</th>   
                    <th>시작시간</th>   
                    <th>종료시간</th>   
                </tr>
                <%
                while (rs.next()) {
                	if(resvno.equals(rs.getString(1))) {
                		b = true;
                %>
                <tr>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%>년<%=rs.getString(5)%>월<%=rs.getString(6)%>일</td>
                    <td><%=rs.getString(7)%></td>
                    <td><%=rs.getString(8)%></td>
                    <td><%=rs.getString(9)%></td>
                    <td><%=rs.getString(10)%></td>
                    <td><%=rs.getString(11)%></td>
                </tr>
            	<a href="List.jsp" class="A">돌아가기</a>              
                <%
                }
}
                %>
            </table>
        </div>
    </section>
                <%
                if(b == false) {        
                %>
                <h1 class="HH">좌석예약정보가 존재하지 않습니다!</h1>
                <a href="RegiList.jsp" class="A">돌아가기</a>
                <%
                }
                %>
                <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>