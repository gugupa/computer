<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
  
    <title>个人中心</title>
    
    <link rel="stylesheet"  href="css/bootstrap.min.css">
    <link rel="stylesheet"  href="css/font-awesome.min.css">
    <link rel="shortcut icon" href="images/shorticon.png" />
    
	<link rel="stylesheet" href="css/styles.css">
	<link rel="stylesheet" href="css/person.css">
	
	
  </head>
      
  <body>
    <a class="btn btn-default" href="editUser.jsp">修改资料</a>  
  </body>
</html>
