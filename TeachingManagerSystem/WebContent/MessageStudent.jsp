<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="conn.jsp"%>
<html>
<head>
<title>公告信息页面</title>
<style type="text/css">
<!--
#Layer1 {
	position: absolute;
	width: 500px;
	height: 260px;
	overflow-y: auto;
	z-index: 1;
	top: 250px;
	left: 395px;
}

#Layer2 {
	position: absolute;
	width: 300px;
	height: 200px;
	z-index: 1;
	top: 230px;
	left: 290px;
}

#Layer3 {
	position: absolute;
	width: 300px;
	height: 200px;
	z-index: 1;
	top: 20px;
	left: 350px;
}

#Layer4 {
	position: absolute;
	width: 300px;
	height: 200px;
	z-index: 1;
	top: 80px;
	left: 220px;
}

#Layer5 {
	position: absolute;
	width: 300px;
	height: 200px;
	z-index: 1;
	top: 185px;
	left: 290px;
}

#Layer8 {
	position: absolute;
	width: 500px;
	height: 500px;
	z-index: 1;
	top: 450px;
	left: 550px;
}
-->
</style>
</head>
<body background="images/forgetpassword.png" scroll="no">
	<br>
	<br>
	<div id="Layer2">
		<hr align="center" width="715" color="blue">
	</div>
	<div id="Layer3">
		<h1>
			<font size="5" color="blue">辅助教学管理系统留言信息
		</h1>
	</div>
	<div id="Layer4">
		<p>
			<font size="6" color="white">留言栏</font>
		</p>
	</div>
	<div id="Layer5">
		<p>
			<font size="4" color="blue"><a href="StudentMain.jsp"
				style="text-decoration: none">返回</a></font><font size="4" color="black">>留言信息</font>
		</p>
	</div>
	<div id="Layer1">
		<form action="MessageStudentPost.jsp" method="post">
			请在留言板里输入留言:<br>
			<br>
			<textarea name="info" rows="7" cols="50"></textarea>
			<br>
			<br> <input type="submit" value="留言">
		</form>
		<B>留言列表</B>
		<%
			//查询图书目录信息
			Statement ST = conn.createStatement();
			String SQL = "select * from messageInfo order by time desc";
			ResultSet RS = ST.executeQuery(SQL);

			while (RS.next()) {
				out.print("<font size=3 color=black><p align='left'>" + RS.getString("userName") + "：</p>");
				out.print("<p align='left'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + RS.getString("messageContent")
						+ "</p>");
				out.print("<p align='right'>" + RS.getString("time") + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>");
				out.print("<hr>");
				out.println("</font>");
			}
			//conn.close();
			//response.sendRedirect("communicate.jsp");
		%>
	</div>
</body>
</html>
