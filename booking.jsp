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
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String booking_title = request.getParameter("booking_title");
		String mdate = request.getParameter("mdate");
		String mnumber = request.getParameter("mnumber");
		Object tmp_name = session.getAttribute("nickname");
		String mname = (String)tmp_name;
	
		rs = stmt.executeQuery("SELECT * FROM booking WHERE board_title = '" + booking_title + "' AND member_name = '"+mname+"';");
		int tmp = 0;
	
    	while (rs.next()) {
        	tmp = 1;
    	}
	
		if (tmp == 0) {
			String sql = "INSERT INTO booking (board_title, member_name, bdate, bnumber) VALUES ('"+booking_title+"', '"+mname+"', '"+mdate+"', '"+mnumber+"');";
			int result = stmt.executeUpdate(sql);
		}


	

		conn.close();
	
		response.sendRedirect("https://www.haengsa.kro.kr/login.html");
	} catch (Exception e) {

	e.printStackTrace();
	}
%>

