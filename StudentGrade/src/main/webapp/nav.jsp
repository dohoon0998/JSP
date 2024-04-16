<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	}
	nav {
	background: gray;
	}
	ul {
	list-style-type: none;
	display: flex;
	padding: 7px 0;
	}
	li {
	text-decoration: none;
	color: black;
	margin: 0 10px;
	}
	a {
	text-decoration: none;
	color: black;
	}
	a:hover{
	color: pink;
	}
	-+
</style>

<body>
	<nav>
		<ul>
				<li><a href="insert.jsp">학생샘플</a></li>
				<li><a href="insert_post.jsp">학생성적입력</a></li>
				<li><a href="insert_stu.jsp">학생정보</a></li>
				<li><a href="index.jsp">홈으로</a></li>
			
		</ul>
	</nav>
</body>
</html>