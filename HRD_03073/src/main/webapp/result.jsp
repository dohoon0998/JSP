<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
StringBuffer sb = new StringBuffer();
sb.append(" select  ");
sb.append(" v_name, ");
sb.append(" substr(v_jumin, 3, 2)||'월'||substr(v_jumin, 5, 2)||'일생', ");
sb.append(" substr(v_jumin, 1, 2), ");
sb.append(" substr(v_jumin, 7, 1), ");
sb.append(" m_no, ");
sb.append(" substr(v_time, 1, 2)||':'||substr(v_time, 3, 2), ");
sb.append(" v_confirm, ");
sb.append(" substr(v_jumin, 3, 2), ");
sb.append(" substr(v_jumin, 5, 2), ");
sb.append(" substr(v_jumin, 1, 1) ");
sb.append(" from tbl_vote202005 ");

String sql = sb.toString();
System.out.println(sql);
Connection conn = JDBConnection.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

int i;
int ma;
String str2;
String str;
String str3;
//현재 날짜를 가져옵니다.
LocalDate today = LocalDate.now();

// 오늘의 월과 일을 가져옵니다.
int month = today.getMonthValue();
int day = today.getDayOfMonth();
System.out.println(month + "월" + day);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ include file="inter.jsp"%>
	<section>
		<h2 class="title">투표검수조회</h2>

		<table border="1">
			<tr>
				<td>성명</td>
				<td>생년월일</td>
				<td>나이</td>
				<td>성별</td>
				<td>후보번호</td>
				<td>투표시간</td>
				<td>유권자확인</td>
			</tr>
			<%
			while (rs.next()) {
			%>
			<%
			str3 = rs.getString(10);
			i = Integer.parseInt(rs.getString(3));
			str = rs.getString(7);
			str2 = rs.getString(4);
			
			
			if (str2.equals("9") || str2.equals("0")) {
				i += 1800;
			} else if(str2.equals("1") || str2.equals("2")){
				i += 1900;
			} else if(str2.equals("3") || str2.equals("4")){
				i += 2000;
			} else if(str2.equals("5") || str2.equals("6")){
				i += 1900;
			} else if(str2.equals("7") || str2.equals("8")){
				i += 2000;
			}
			
			ma = 2020 - i;

			if (rs.getInt(8) > month) {
				ma = ma - 1;
			}else if(rs.getInt(8) == month){
				if(rs.getInt(9) > day){
					ma = ma - 1;
				}
			}

			if (ma > 120) {
				if (str2.equals("9")) {
					str2 = "남";
				} else if (str2.equals("0")) {
					str2 = "여";
				}
			} else if (ma > 20) {
				if (str2.equals("1") || str2.equals("5")) {
					str2 = "남";
				} else if (str2.equals("2") || str2.equals("6")) {
					str2 = "여";
				}
			} else if (ma < 20) {
				if (str2.equals("3") || str2.equals("7")) {
					str2 = "남";
				} else if (str2.equals("4") || str2.equals("8")) {
					str2 = "여";
				}
			}

			if (str.equals("N")) {
				str = "미확인";
			} else if (str.equals("Y")) {
				str = "확인";
			}
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%= i %>년<%= rs.getString(2) %> </td>
				<td>만<%=ma%>세
				</td>
				<td><%=str2%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=str%></td>
			</tr>
			<%
			}
			%>
		</table>

	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>