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

String sql = "select custno, custname, phone, address, joindate, grade, city from member_tbl_02 order by custno";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();
%>
</head>
<body>
        <h3 class="H3">회원목록조회/수정</h3>
    <section class="Sec">
        <div>
            <table border=1>
                <tr>
                    <td>회원번호</td>
                    <td>회원성명</td>
                    <td>전화번호</td>
                    <td>주소</td>
                    <td>가입일자</td>
                    <td>고객등급</td>
                    <td>거주지역</td>    
                </tr>
                <tr>
                   
                    <td><a href="Edit.jsp?custno=<%=rs.getString(1)%>&custname=<%=rs.getString(2)%>&phone=<%=rs.getString(3)%>&address=<%=rs.getString(4)%>&joindate=<%=rs.getString(5)%>&grade=<%=rs.getString(6)%>&city=<%=rs.getString(7)%>"><%=rs.getString(1)%></a></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5).substring(0, 10)%></td>
                    <td><%=rs.getString(6).equalsIgnoreCase("A") ? "VIP" : rs.getString(6).equalsIgnoreCase("B") ? "일반" : (rs.getString(6).equalsIgnoreCase("C") ? "직원" : "")%></td>
                    <td><%=rs.getString(7)%></td>
                    
                                
                </tr>

                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><a href="Edit.jsp?custno=<%=rs.getString(1)%>&custname=<%=rs.getString(2)%>&phone=<%=rs.getString(3)%>&address=<%=rs.getString(4)%>&joindate=<%=rs.getString(5)%>&grade=<%=rs.getString(6)%>&city=<%=rs.getString(7)%>"><%=rs.getString(1)%></a></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5).substring(0, 10)%></td>
                    <td><%=rs.getString(6).equalsIgnoreCase("A") ? "VIP" : rs.getString(6).equalsIgnoreCase("B") ? "일반" : (rs.getString(6).equalsIgnoreCase("C") ? "직원" : "")%></td>
                    <td><%=rs.getString(7)%></td>
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