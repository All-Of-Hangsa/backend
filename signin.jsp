<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Connection conn = null;
	ResultSet rs = null;
      
	String url = "jdbc:mysql://10.10.31.11:3306/llj_db?serverTimezone=UTC";
	String id = "llj";
	String pwd = "QWERqwer1234!@";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, id, pwd);
		Statement stmt = conn.createStatement();
    
		String umail = request.getParameter("umail");		
		String upw1 = request.getParameter("upw1");

		String sql = "SELECT * FROM member where mail='"+ umail +"'" ;
		rs = stmt.executeQuery(sql);
		
		if (rs.next()){
			if (rs.getString("pwd").equals(upw1)) {
			session.setAttribute("nickname", rs.getString("nickname"));
		} 	else {
			response.sendRedirect("http://llj-web-lb-15022402-b5dd0ab26565.kr.lb.naverncp.com/signin.html");
				} 
		}else{
			response.sendRedirect("http://llj-web-lb-15022402-b5dd0ab26565.kr.lb.naverncp.com/signin.html");
		}
		

		conn.close();
		response.sendRedirect("http://llj-web-lb-15022402-b5dd0ab26565.kr.lb.naverncp.com/login.html");
		
	} catch (Exception e) {

		e.printStackTrace();
	}	
%>