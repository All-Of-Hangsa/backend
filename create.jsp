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
		String sdate = request.getParameter("start_date");
		String edate = request.getParameter("end_date");
		String region = request.getParameter("region");
		String dregion = request.getParameter("dregion");
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		Object tmp_writer = session.getAttribute("nickname");
		String writer = (String)tmp_writer;
		
		String sql = "insert into board (title, content, region, dregion, btype, sdate, edate, admit, writer) values ('"+title+"', '"+body+"', '"+region+"', '"+dregion+"', '"+type+"', '"+sdate+"', '"+edate+"', 'No', '"+writer+"');";
		int result = stmt.executeUpdate(sql);

	
		

		conn.close();
		
		response.sendRedirect("http://llj-web-lb-15022402-b5dd0ab26565.kr.lb.naverncp.com/login.html");
	} catch (Exception e) {

		e.printStackTrace();
	}	
%>