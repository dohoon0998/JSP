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

String sql = "SELECT teacher_code, teacher_name, class_name, substr(class_price, 1, 3), substr(class_price, 4, 3), substr(teacher_regist_date, 1, 4), substr(teacher_regist_date, 5, 2), substr(teacher_regist_date, 7, 2) "
        + "from tbl_teacher_202201";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();
%>
</head>
<body>
        <h3 class="H3">강사조회</h3>
    <section class="Sec">
        <div>
            <table border=1>

                <tr>
                    <td>강사코드</td>
                    <td>강사명</td>
                    <td>강의명</td>
                    <td>수강료</td>
                    <td>강사자격취득일</td>
                    
                </tr>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td>₩<%=rs.getString(4)%>,<%=rs.getString(5)%></td>
                    <td><%=rs.getString(6) + "년" + rs.getString(7) + "월" + rs.getString(8) + "일"%></td>             
                </tr>

                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td>₩<%=rs.getString(4)%>,<%=rs.getString(5)%></td>
                    <td><%=rs.getString(6) + "년" + rs.getString(7) + "월" + rs.getString(8) + "일"%></td>
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