 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <link rel="stylesheet"  href="css/bootstrap.min.css">
    <link rel="stylesheet"  href="css/font-awesome.min.css">
    <link rel="shortcut icon" href="images/shorticon.png" />
    
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/menubar.css">
 
    <%@taglib prefix="s" uri="/struts-tags"%>
	<%@taglib prefix="cp" uri="/computer"%>
	
    <title>添加文章</title>
    
  </head>
  
  <body>
    <%@include file="common/menubar.jsp"%>
    
  <main class="contain">
	
	<div class="panel panel-default col-md-12">
	  <div class="panel-body panel-info">
	     <s:form id="writeArticle" name="writeArticle" action="Article_releaseArticle" method="POST" cssClass="edit_articles col-md-12">
	       <div class="form-group">
		    <label for="title">标题</label>
		    <s:textfield id="tltie" name="title" cssClass="form-control input-title"/>
		   </div>
		   <div class="form-group">
		    <label for="acontent">内容</label>
		    <s:textarea id="acontent" name="acontent" cssClass="form-control input-content" rows="28"/>
		   </div>
		   <div class="form-group">
		    <input type="button" value="保存" onclick="writeArticle.action='Article_saveArticle';writeArticle.submit();"  class="btn btn-warning"/>
		    <s:submit value="发布" cssClass="btn btn-success "></s:submit>
		   </div>
		  </s:form>  
	  </div>
	</div>
      
    
      <s:if test="hasActionMessages()">
	    <cp:msgdialog basepath="<%=basePath%>">
	    	<s:actionmessage/>
	    </cp:msgdialog>	
	  </s:if>
  </main>	 
  </body>
</html>
