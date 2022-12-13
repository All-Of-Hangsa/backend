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

        String url = "jdbc:mysql://10.10.31.11:3306/llj_db?serverTimezone=UTC";
        String id = "llj";
        String pwd = "QWERqwer1234!@";

        try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, id, pwd);
                Statement stmt = conn.createStatement();

                String mname = request.getParameter("member");

                String sql = "select * from booking, board where booking.board_title = board.title AND booking.member_name = '"+mname+"'";
                rs = stmt.executeQuery(sql);


                JSONObject jsonob = new JSONObject();
            JSONArray jsonarr = new JSONArray();
            while (rs.next()) {
                JSONObject data = new JSONObject();
                data.put("writer", rs.getString("writer"));
                data.put("board_title", rs.getString("board_title"));
                data.put("region", rs.getString("region"));
                data.put("bdate", rs.getString("bdate"));
                jsonarr.add(data);

                }

            out.println(jsonarr);


                conn.close();

        } catch (Exception e) {

                e.printStackTrace();
        }
%>
