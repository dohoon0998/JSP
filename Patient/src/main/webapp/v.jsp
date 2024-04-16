<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:include page="header.jsp"></jsp:include>
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

String sql = "SELECT p_no, p_name, subStr(p_birth, 1, 4), subStr(p_birth, 5, 2), subStr(p_birth, 7, 8), p_gender, p_tel1, p_tel2, p_tel3, p_city "
        + "from tbl_patient_202004";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

rs.next();
%>
</head>
<body>
        <h3 class="H3">환자조회</h3>
    <section class="Sec">
        <div>
            <table border=1>

                <tr>
                    <td>환자 코드</td>
                    <td>환자 이름</td>
                    <td>환자 생년월일</td>
                    <td>환자 성별</td>
                    <td>환자 전화번호</td>
                    <td>환자거주지</td>
                </tr>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3) + "년" + rs.getString(4) + "월" + rs.getString(5) + "일"%></td>
                    <td><%=rs.getString(6).equalsIgnoreCase("M") ? "남" : (rs.getString(6).equalsIgnoreCase("F") ? "여" : "")%></td>
                    <td><%=rs.getString(7) + "-" + rs.getString(8) + "-" + rs.getString(9)%></td>
                    <td><%=rs.getString(10).equalsIgnoreCase("10") ? "서울" : rs.getString(10).equalsIgnoreCase("20") ? "경기"
                    		: rs.getString(10).equalsIgnoreCase("10") ? "서울" : rs.getString(10).equalsIgnoreCase("30") ? "강원" 
                    		: rs.getString(10).equalsIgnoreCase("10") ? "서울" : (rs.getString(10).equalsIgnoreCase("40") ? "대구" : "")%></td>             
                </tr>

                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3) + "년" + rs.getString(4) + "월" + rs.getString(5) + "일"%></td>
                    <td><%=rs.getString(6).equalsIgnoreCase("M") ? "남" : (rs.getString(6).equalsIgnoreCase("F") ? "여" : "")%></td>
                    <td><%=rs.getString(7) + "-" + rs.getString(8) + "-" + rs.getString(9)%></td>
                    <td><%=rs.getString(10).equalsIgnoreCase("10") ? "서울" : rs.getString(10).equalsIgnoreCase("20") ? "경기"
                    		: rs.getString(10).equalsIgnoreCase("10") ? "서울" : rs.getString(10).equalsIgnoreCase("30") ? "강원"
                    		: rs.getString(10).equalsIgnoreCase("10") ? "서울" : (rs.getString(10).equalsIgnoreCase("40") ? "대구" : "")%></td>
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