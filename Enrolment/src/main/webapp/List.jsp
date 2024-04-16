<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:include page="Header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Global.css">
<meta charset="UTF-8">
<title>환자조회</title>
<%
ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select id, co_name, credit, lecturer_idx, week, start_hour, end_hour "
			+ "from course_tbl";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

%>
</head>
<body>
        <h3 class="H3">교과 목록</h3>
    <section class="Sec">
        <div>
            <table border=1>

                <tr>
                    <th>과목코드</th>
                    <th>과목명</th>
                    <th>학점</th>
                    <th>교수명</th>
                    <th>요일</th>
                    <th>시작시간</th>
                    <th>종료시간</th>
                    <th>비고</th>         
                </tr>

                <%
                while (rs.next()) {
                	
                	String time = rs.getString(6);

                	String Subtime = time.substring(0, 2) + "시" + time.substring(2) + "분";
                %>
                <tr>
                    <td><a href="Update.jsp?id=<%=rs.getString(1)%>&co_name=<%=rs.getString(2)%>&credit=<%=rs.getString(3)%>&lecturer_idx=<%=rs.getString(4)%>&week=<%=rs.getString(5)%>&start_hour=<%=rs.getString(6)%>&end_hour=<%=rs.getString(7)%>"><%=rs.getString(1)%></a></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4).equalsIgnoreCase("1") ? "김교수" : rs.getString(4).equalsIgnoreCase("2") ? "이교수" : rs.getString(4).equalsIgnoreCase("3") ? "박교수" : rs.getString(4).equalsIgnoreCase("4") ? "최교수" : rs.getString(4).equalsIgnoreCase("5") ? "피교수" : (rs.getString(4).equalsIgnoreCase("6") ? "깡교수" : "")%></td>
                    <td><%=rs.getString(5).equalsIgnoreCase("1") ? "월" : rs.getString(5).equalsIgnoreCase("2") ? "화" : rs.getString(5).equalsIgnoreCase("3") ? "수" : rs.getString(5).equalsIgnoreCase("4") ? "목" : rs.getString(5).equalsIgnoreCase("5") ? "금" : (rs.getString(5).equalsIgnoreCase("6") ? "토" : "")%></td>
                    <td><%= Subtime %></td>
                    <td><%=rs.getString(7)%></td>
                    <td><a href="delpro2.jsp?id=<%=rs.getString(1)%>">삭제</a><td>
                </tr>
                <%
                }
                %>
            </table>
        </div>
    </section>
</body>
<jsp:include page="Footer.jsp"></jsp:include>
</html>