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
	<link rel="stylesheet" href="css/index.css">
	
 <script>
    function getResult(keyword){
        var mainframe=document.getElementById('mainframe');
        mainframe.src="Article_searchArticles?keyword=编程语言&ie=utf-8";
    }   
 </script>
  </head>
  
  <body>
  ogi<header>
      <nav class="banner">
	     <ul class="nav nav-pills">
	       <li role="presentation" class="active">
	           <a href="<%=basePath%>/index.jsp?user.id=${user.id}" class="banner_a"><i class="fa fa-ul fa-magic"></i>首页</a>
	       </li>
	       <li role="presentation"><a href="#" onClick="getResult('编程语言')"class="banner_a">编程语言</a></li>
	       <li role="presentation"><a href="#" onClick="getResult(text)" class="banner_a">web开发</a></li>
	       <li role="presentation"><a href="#" onClick="getResult()" class="banner_a">移动开发</a></li>
	       <li role="presentation"><a href="#" onClick="getResult()"class="banner_a">硬件开发</a></li>
	       <li role="presentation"><a href="#" onClick="getResult()"class="banner_a">数据库</a></li>
	       <li role="presentation" class="dropdown">	       
	        <c:choose>
	           <c:when test="${session.user==null}">
	              <div class="LogOrReg">
	                 <a href="<%=basePath%>/login.jsp" target="_self" data-toggle="modal" data-target="#loginbox">登录</a>
	                 <a href="<%=basePath%>/regUser.jsp" target="_self">注册</a> 
	              </div> 
	           </c:when>
	           <c:otherwise>
	                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
					  <img src="<%=basePath%>/upload/${user.img}" />
				      Hi&nbsp;, ${session.user.username}&nbsp;&nbsp;<span class="caret"></span>
				    </a>
					<ul class="dropdown-menu">
					      <li>${session.user.integtal}</li>
				         <li><a href="Person.jsp" target="_self">个人中心</a> </li>
				    </ul>
	           </c:otherwise>
	        </c:choose>
	       </li>
	     </ul>
     </nav>
  </header>
  <main class="contain">
     
     	  
		 		  
    <div class="add_article_button  col-md-2">
            <a class="btn btn-danger btn-lg active" target="_self" href="<%=basePath%>/writeArticle.jsp">写文章</a>
        </a>
    </div>

    <div class="search_box">
        <s:form action="Article_searchArticles" method="post" cssClass="form-inline">
          <div class="input-group ">
			<s:textfield name="keyword" id="exampleInputAmount" cssClass="form-control search_input"/>
			<div class="input-group-addon  addon_button"><s:submit value="查询" cssClass="btn btn-primary search_button"></s:submit></div>
		  </div>
		  
	    </s:form>
    </div>
       
    <div>
       <iframe id="mainframe" src="Article_browseArticlesByPage?page=1" name="mainframe"  scrolling="auto" width="1014px" class="mainframe"></iframe>  
    </div>
  </main>
  
  <!-- 用于登录的模态框 -->
   <div id="loginbox">
       
   </div>
   
   <script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
  </body>
</html>
