<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>文章列表</title>
    
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
	<link rel="shortcut icon" href="images/shorticon.png"/>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" type="text/css" href="css/resultList.css">
  </head>
  
  <body>
     
   <ul> 
    <c:forEach items="${articles}" var="article"> 
	  <li class="resultList">	 
	     <div class="rslist_title">
		    <a href="Article_loadArticle?id=${article.articleId}" target="_blank">
		       <c:out value="${article.title}"/>
		    </a>          
	     </div> 
	     <div class="rslist_acontent"> 
		    <a href="Article_loadArticle?id=${article.articleId}" target="_blank">
		      <c:out value="${article.acontent}"/>
		    </a>
		 </div> 	   
      </li>   
    </c:forEach>
   </ul>          

  </body>
</html>
