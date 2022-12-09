<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Connection conn = null;
	ResultSet rs = null;
      
	String url = "jdbc:mysql://localhost:3306/llj_db?serverTimezone=UTC";
	String id = "root";
	String pwd = "qwer1234";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, id, pwd);
		Statement stmt = conn.createStatement();
    
		String uid = request.getParameter("uid");
		String uname = request.getParameter("uname");
		String upw = request.getParameter("upw");

		String sql = "INSERT INTO users (uid, uname, upw) VALUES ('"+uid+"', '"+uname+"', '"+upw+"')";
		int result = stmt.executeUpdate(sql);
		

		conn.close();
		
		response.sendRedirect("http://localhost/front.html");
	} catch (Exception e) {

		e.printStackTrace();
	}	
%>