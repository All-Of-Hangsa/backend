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
    
		String uname = request.getParameter("uname");
		String umail = request.getParameter("umail");
		String uid = request.getParameter("uid");
		String upw1 = request.getParameter("upw1");
		String upw2 = request.getParameter("upw2");
		String utype = request.getParameter("usertype");
		
		rs = stmt.executeQuery("SELECT * FROM member WHERE mail = '"+umail+"' OR nickname = '"+uname+"';");
		int tmp = 0;
		
        while (rs.next()) {
            response.sendRedirect("https://www.haengsa.kro.kr/signup.html");
            tmp = 1;
        }
		
		if (upw1.equals(upw2) && tmp == 0) {
			String sql = "INSERT INTO member (mail, pwd, nickname, usertype) VALUES ('"+umail+"', '"+upw1+"', '"+uname+"', '"+utype+"');";
			int result = stmt.executeUpdate(sql);
		} else {
			response.sendRedirect("https://www.haengsa.kro.kr/signup.html");
		}

	
		

		conn.close();
		
		response.sendRedirect("https://www.haengsa.kro.kr/signin.html");
	} catch (Exception e) {

		e.printStackTrace();
	}	
%>