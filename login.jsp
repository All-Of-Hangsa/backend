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

                String uid = request.getParameter("uid");
                String uname = request.getParameter("uname");
                String upw = request.getParameter("upw");

                String sql = "INSERT INTO users (uid, uname, upw) VALUES ('"+uid+"', '"+uname+"', '"+upw+"')";
                int result = stmt.executeUpdate(sql);


                conn.close();

                response.sendRedirect("https://www.haengsa.kro.kr/front.html");
        } catch (Exception e) {

                e.printStackTrace();
        }
%>
