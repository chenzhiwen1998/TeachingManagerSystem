
<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="conn.jsp"%>
<%
request.setCharacterEncoding("utf-8");
String sno=request.getParameter("sno");
Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,    //前后移动，感知
ResultSet.CONCUR_UPDATABLE);   //可更新
// 4.执行SQL查询，返回数据集

ResultSet rs = st.executeQuery("select * from studentInfo");
Statement st1 = conn.createStatement();
ResultSet rs1=st1.executeQuery("select * from studentInfo where(studentNo='"+sno+"')");
if(rs1.next())
{
out.println("<SCRIPT language=javascript>alert('该账号已存在，请直接登录！'); window.location='Login.jsp';</script>");
}
   else{
//新增数据
      rs.moveToInsertRow();                //移动到新增行
      rs.updateString("studentName",request.getParameter("sname"));
      rs.updateString("studentNo",request.getParameter("sno"));
      rs.updateString("passWord",request.getParameter("pword"));
      rs.updateString("Age",request.getParameter("age"));
      rs.updateString("Sex",request.getParameter("sex"));
      rs.updateString("QQ",request.getParameter("qq"));
      rs.updateString("Email",request.getParameter("email"));
      rs.updateString("StudentPrefession",request.getParameter("sprofession"));
      rs.insertRow();                           //插入新增行
      //5.关闭数据库连接  
      conn.close();
      response.sendRedirect("Login.jsp");
}
%>
