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
    
    <title>${session.tempArticle.title}</title>
	<link rel="stylesheet" type="text/css" href="css/styles.css">
  </head>
  
  <body>
  <div class="contain" style="height:1800px;">
  
     <div class="head">
         <div class="head_right"><a  target="_self" href="<%=basePath%>/login.jsp">登录</a>|<a  target="_self" href="<%=basePath%>/regUser.jsp">注册</a></div>
	     <h1><img src="<%=basePath%>/images/logo.png"/></h1>
	     <hr/>
     </div>
     
     <div class="banner">
	     <ul>
	       <li><a href="<%=basePath%>/index.jsp?user.id=${user.id}">首页</a></li>
	       <li><a href="<%=basePath%>/resultList.jsp?keyword='编程语言'">编程语言</a></li>
	       <li><a href="<%=basePath%>/resultList.jsp?user.id=${user.id}">web开发</a></li>
	       <li><a href="<%=basePath%>/resultList.jsp?user.id=${user.id}">移动开发</a></li>
	       <li><a href="<%=basePath%>/resultList.jsp?user.id=${user.id}">硬件开发</a></li>
	       <li><a href="<%=basePath%>/resultList.jsp?user.id=${user.id}">数据库</a></li>
	     </ul>
     </div>
     
     <div >
		     <img src="<%=basePath%>/upload/${user.img}" />
		     <span >Hi&nbsp;, &nbsp;${session.user.username}</span>
		     <span >等级：${session.user.integtal}</span>
    </div>		  
	   
    <div class="result">
        <div class="result_title"><c:out value="${session.tempArticle.title}"></c:out></div>
        <div class="result_content"><c:out value="${session.tempArticle.acontent}"></c:out></div>
    </div>
 </div>
 
  </body>
</html>
