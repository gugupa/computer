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
    
    <title>My JSP 'resultList.jsp' starting page</title>
    
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
	<link rel="shortcut icon" href="images/shorticon.png"/>

	<link rel="stylesheet" type="text/css" href="css/styles.css">


  </head>
  
  <body  style="background-image:none;overflow:hidden;">
 <table height="872" class="resultList" >    
    <c:forEach items="${articles}" var="article"> 
		<tr class="rslist_title" > 
		    <td><a href="Article_loadArticle?id=${article.articleId}" target="_blank"><c:out value="${article.title}"/></a></td>          
	    </tr>     
		<tr class="rslist_acontent">
		    <td height="340"><a href="Article_loadArticle?id=${article.articleId}" target="_blank"><c:out value="${article.acontent}"/></a></td>
		</tr>
	   
   </c:forEach>  
        
</table>   
  <p><img src="images/background.jpg" width="610" height="407"></p>
  </body>
</html>
