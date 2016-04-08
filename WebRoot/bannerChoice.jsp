<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bannerChoice.jsp' starting page</title>
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
	<link rel="shortcut icon" href="images/shorticon.png"/>
	
	<link rel="stylesheet" type="text/css" href="./css/styles.css"/>

  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
