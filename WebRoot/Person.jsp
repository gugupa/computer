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
  <ul>
     <li><a class="btn btn-default" href="editUser.jsp"><i class="fa fa-ul fa-edit"></i>修改资料</a></li>
     <li><a class="btn btn-default" href="editUser.jsp"><i class="fa fa-ul fa-database"></i>管理博客</a></li>
     <li><a class="btn btn-default" href="editUser.jsp"><i class="fa fa-ul fa-key"></i>修改密码</a></li>
     <li><a class="btn btn-default" href="editUser.jsp"><i class="fa fa-ul fa-gear"></i>账户管理</a></li>
  </ul>
    
  </body>
</html>
