<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생성적입력</title>
<style>
			*{
			box-sizing: border-box;
			margin: 0;
			}
			div{
			display: flex;
			justify-content: center;
			}
			h2{
			margin-bottom: 10px;
			}
</style>

	<%@include file = "header.jsp" %>
	<%@include file = "nav.jsp" %>
	<%@include file = "footer.jsp" %>
	
</head>
<body>
	<section>
		<h2 align="center">학생 성적 등록</h2>
		    <form action="insert_post_confirm.jsp" name="form">
		    <div>
			<table border=1>
	<tr>
						<td>학번</td>
						<td><input type="text" name="id"  ></td>
					</tr>
				
					<tr>
						<td>국어</td>
						<td><input type="text" name="korean" ></td>
					</tr>
					
					<tr>
						<td>영어</td>
						<td><input type="text" name="english" ></td>
					</tr>
					
					<tr>
						<td>수학</td>
						<td><input type="text" name="math" ></td>
					</tr>
					
					
						<tr>
						<td>역사</td>
						<td><input type="text" name="history"></td>
					</tr>

					
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="등록" onclick="Update()" name="submit"> 
						</td>
					</tr>
				</table>
                </div>
			</form>
	</section>
</body>
</html>