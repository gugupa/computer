 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <link rel="stylesheet"  href="css/bootstrap.min.css">
    <link rel="stylesheet"  href="css/font-awesome.min.css">
    <link rel="shortcut icon" href="images/shorticon.png" />
    
	<link rel="stylesheet" type="text/css" href="css/styles.css">
 ·
    <%@taglib prefix="s" uri="/struts-tags"%>
	<%@taglib prefix="cp" uri="/computer"%>
	
    <title>添加文章</title>
    
  </head>
  
  <body>
    <table class="center_box">
     <s:form action="Article_saveArticle" method="POST">
	    <tr><td>标题</td><td><s:textfield id="tltie" name="title"/></td></tr>
	    <tr><td>内容</td><td ><s:textarea id="acontent" name="acontent" cssStyle="write_acontent"/></td></tr>
	    <tr><td><input type="button" value="保存"/></td><td><s:submit value="发布"></s:submit></td></tr>
	 </s:form>
    </table>
    
      <s:if test="hasActionMessages()">
	    <cp:msgdialog basepath="<%=basePath%>">
	    	<s:actionmessage/>
	    </cp:msgdialog>	
	  </s:if>
	 
  </body>
</html>
