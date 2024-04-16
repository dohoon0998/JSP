<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:include page="Header.jsp"></jsp:include>
<link rel="stylesheet" href="Global.css">
<!DOCTYPE html>
<html>
<head>
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

String sql = "select menu_cd, menu_nm, price, menu_fg from menu_tbl_007";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();
%>
</head>
<body>
        <h3 class="H3">메뉴등록/수정</h3>
    <section class="Sec">
        <div>
            <table border=1>

                <tr>
                    <td>메뉴코드</td>
                    <td>메뉴명</td>
                    <td>메뉴가격</td>
                    <td>메뉴구분</td>
                    
                </tr>
                <tr>
                    <td><a href="MenuEdit.jsp?menu_cd=<%=rs.getString(1)%>&menu_nm=<%=rs.getString(2)%>&price=<%=rs.getString(3)%>"><%=rs.getString(1)%></a></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%>원</td>                  
                    <td><%=rs.getString(4).equalsIgnoreCase("0") ? "커피" : (rs.getString(4).equalsIgnoreCase("1") ? "티" : "")%></td>
                                 
                </tr>

                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><a href="MenuEdit.jsp?menu_cd=<%=rs.getString(1)%>&menu_nm=<%=rs.getString(2)%>&price=<%=rs.getString(3)%>"><%=rs.getString(1)%></a></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%>원</td>                   
                    <td><%=rs.getString(4).equalsIgnoreCase("0") ? "커피" : (rs.getString(4).equalsIgnoreCase("1") ? "티" : "")%></td>
                </tr>
                <%
                }
                %>
                <tr>
                <td><a href="MenuRegi.jsp">등록</a></td>
                </tr>
            </table>
        </div>
    </section>
</body>
<jsp:include page="Footer.jsp"></jsp:include>
</html>