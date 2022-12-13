<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
if (session.getAttribute("nickname") != null) {
        Object tmp_name = session.getAttribute("nickname");
        String mname = (String)tmp_name;
        response.sendRedirect("https://www.haengsa.kro.kr/login.html?member="+mname);
}else {
        response.sendRedirect("https://www.haengsa.kro.kr/index.html");
}
%>
