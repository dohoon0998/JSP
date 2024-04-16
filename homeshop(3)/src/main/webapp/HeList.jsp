<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="Global.css">
<%
ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select mem.custno, mem.custname, mem.grade, sum(mon.price) "
			+ "from member_tbl_02 mem, money_tbl_02 mon "
			+ "where mem.custno = mon.custno "
			+ "group by mem.custno, mem.custname, mem.grade "
			+ "order by sum(mon.price) desc";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();
%>
</head>
<body>
        <h3 class="H3">회원매출조회</h3>
    <section class="Sec">
        <div>
            <table border=1>
                <tr>
                    <td>회원번호</td>
                    <td>회원성명</td>
                    <td>고객등급</td>
                    <td>매출</td>    
                </tr>
                <tr>
                   
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3).equalsIgnoreCase("A") ? "VIP" : rs.getString(3).equalsIgnoreCase("B") ? "일반" : (rs.getString(3).equalsIgnoreCase("C") ? "직원" : "")%></td>
                    <td><%=rs.getString(4)%></td>
                    
                                
                </tr>

                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3).equalsIgnoreCase("A") ? "VIP" : rs.getString(3).equalsIgnoreCase("B") ? "일반" : (rs.getString(3).equalsIgnoreCase("C") ? "직원" : "")%></td>
                    <td><%=rs.getString(4)%></td>
                </tr>
                <%
                }
                %>
            </table>
        </div>
    </section>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>