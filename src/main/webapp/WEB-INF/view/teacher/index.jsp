<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
</head>
<body>

<%@include file="nav.jsp"%>

<%
    System.out.println("hello");
    response.sendRedirect(request.getContextPath()+"/teacher/notice_ui");
%>

</body>
</html>
