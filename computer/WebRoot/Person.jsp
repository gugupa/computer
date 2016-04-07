<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Person.jsp' starting page</title>
    
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
	<link rel="shortcut icon" href="images/shorticon.png"/>
	

  </head>
  
  <body>
    ..
  </body>
</html>
