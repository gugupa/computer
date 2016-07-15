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
  
    <title>Cat</title>
    <meta charset="utf-8">

    
    <link rel="stylesheet"  href="css/bootstrap.min.css">
    <link rel="stylesheet"  href="css/font-awesome.min.css">
    <link rel="shortcut icon" href="images/shorticon.png" />
    
	<link rel="stylesheet" href="css/styles.css">
	<link rel="stylesheet" href="css/menubar.css">

  </head>
  
  <body>
  <%@include file="common/menubar.jsp"%>
  <main class="contain"> 
    <!--<div class="row">
       <div class="col-md-2">
        <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#net" aria-expanded="false" aria-controls="collapseExample">
			  .NET技术
		</button>
		<div class="collapse" id="net">
		  <div class="well">
		      <a href="" class="btn btn-link">.NET新手区</a>
		      <a href="" class="btn btn-link">.NET新手区</a>
		      <a href="" class="btn btn-link">.NET新手区</a>
		      <a href="" class="btn btn-link">.NET新手区</a>
		      <a href="" class="btn btn-link">.NET新手区</a>
		      <a href="" class="btn btn-link">.NET新手区</a>
		  </div> 
		</div>
       </div>
       
		<div class="col-md-10">
          <div class="jumbotron">
			  <h1>Hello, world!</h1>
			  <p>...</p>
			  <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
		 </div>
       </div>
       
    </div>
    -->     
    <div class="col-md-12">
       <iframe id="mainframe" src="Article_browseArticlesByPage?page=1" name="mainframe"  scrolling="auto"  class="mainframe col-md-12"></iframe>  
    </div>
  </main>
  

   
   <script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="js/bootstrapValidator.js"></script> 
  </body>
</html>
