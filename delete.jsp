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
                String title = request.getParameter("title");

                String sql = "DELETE FROM board WHERE title='"+title+"';";
                int result = stmt.executeUpdate(sql);
                conn.close();

                response.sendRedirect("https://www.haengsa.kro.kr");
        } catch (Exception e) {

                e.printStackTrace();
        }
%>
