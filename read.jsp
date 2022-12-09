<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setHeader("Access-Control-Allow-Origin","*");
%>

<%
	Connection conn = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
      
	String url = "jdbc:mysql://llj-db-lb-15022424-1406c108fa23.kr.lb.naverncp.com:3306/llj_db?serverTimezone=UTC";
	String id = "root";
	String pwd = "QWERqwer1234!@";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, id, pwd);
		Statement stmt = conn.createStatement();
    
		String title = request.getParameter("title");
		
		String sql = "SELECT * FROM board, images WHERE board.title=images.title AND board.title = '"+ title +"';";
		rs = stmt.executeQuery(sql);

		
		JSONObject jsonob = new JSONObject();
	    JSONArray jsonarr = new JSONArray();
	    while (rs.next()) {
	    	JSONObject data = new JSONObject();
	        data.put("title", rs.getString("title"));
	        data.put("content", rs.getString("content"));
	        data.put("region", rs.getString("region"));
	        data.put("dregion", rs.getString("dregion"));
	        data.put("btype", rs.getString("btype"));
	        data.put("sdate", rs.getString("sdate"));
	        data.put("edate", rs.getString("edate"));
	        data.put("path1", rs.getString("path1"));
	        data.put("path2", rs.getString("path2"));
	        data.put("path3", rs.getString("path3"));
	        data.put("path4", rs.getString("path4"));
	        jsonarr.add(data);

		} 

	    out.println(jsonarr);
		

		conn.close();
		
	} catch (Exception e) {

		e.printStackTrace();
	}	
%>