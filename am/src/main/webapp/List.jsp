<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보</title>
<style>
		 *{
 		 box-sizing: border-box;
  		 margin: 0;
 	     } 
 	     h2{
 	     margin-bottom: 10px;
 	     }
   		 table{
  		 border: 1px solid black;
  		 }
   		 div{
		 display: flex;
	     justify-content: center;
   		 }
         section{
         margin: 0;
         padding: 0;
         position: absolute;
         top: 200px;
         left: 30%;
         }
         section{
         position: absolute;
         left: 35%;
         }
      	 td {
      	 text-align: center;
      	 border: 1px solid black;     	 
      	 }	 
      	 </style>
</head>
	<%@include file = "Header.jsp" %>
	<%@include file = "Nav.jsp" %>
	<%@include file = "Footer.jsp" %>
	<%  
ResultSet rs = null;  
Connection conn = null;  
PreparedStatement pstmt = null;  

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select * from member_tbl_02";
   
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
	
rs.next();
%>
<body>
      <div>
<table>

      <tr>
         <td>회원번호</td>
         <td>회원성명</td>
         <td>전화번호</td>
         <td>주소</td>
         <td>가입일자</td>
         <td>고객 등급</td>
         <td>거주지역</td>
         <td>삭제</td>
      </tr>
      
      <tr>      	     
      	<td><%=rs.getString(1)%></td>   
		<td><%=rs.getString(2)%></td>
         <td><%=rs.getString(3)%></td>
         <td><%=rs.getString(4)%></td>
         <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
        <td><%=rs.getString(7)%></td>
        <td><a href="delete.jsp">삭제</a></td>
      </tr>
      
      <%
         while (rs.next()) {
      %>
      <tr>      	     
      	<td><%=rs.getString(1)%></td>   
		<td><%=rs.getString(2)%></td>
         <td><%=rs.getString(3)%></td>
         <td><%=rs.getString(4)%></td>
         <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
        <td><%=rs.getString(7)%></td>
        <td><a href="delete.jsp">삭제</a></td>
      </tr>
      <%
         }
      %>
   </table>
   </div>
</body>
</html>