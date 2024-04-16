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

String sql = "select substr(tc.regist_month, 1, 4), substr(tc.regist_month, 5, 2), tm.c_no, tm.c_name, tt.class_name, tc.class_area, substr(tc.tuition, 1, 3), substr(tc.tuition, 4, 3), tm.grade "
        + " from tbl_teacher_202201 tt, tbl_member_202201 tm, tbl_class_202201 tc"
        + " where tm.c_no = tc.c_no and tt.teacher_code = tc.teacher_code";

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
                    <td>수강월</td>
                    <td>회원번호</td>
                    <td>회원명</td>
                    <td>강의명</td>
                    <td>강의장소</td>
                    <td>수강료</td>
                    <td>등급</td>
                    
                </tr>
                <tr>
                    <td><%=rs.getString(1)%>년<%=rs.getString(2)%>월</td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td>₩<%=rs.getString(7)%>,<%=rs.getString(8)%></td>
                    <td><%=rs.getString(9)%></td>             
                </tr>

                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%>년<%=rs.getString(2)%>월</td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td>₩<%=rs.getString(7)%>,<%=rs.getString(8)%></td>
                    <td><%=rs.getString(9)%></td>
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