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
    <link rel="stylesheet" type="text/css" href="css/writeArticle.css">
 
    <%@taglib prefix="s" uri="/struts-tags"%>
	<%@taglib prefix="cp" uri="/computer"%>
	
    <title>添加文章</title>
    
  </head>
  
  <body>
    <header>
      <nav class="banner">
	     <ul class="nav nav-pills">
	       <li role="presentation" class="active">
	           <a href="<%=basePath%>/index.jsp?user.id=${user.id}" class="banner_a"><i class="fa fa-ul fa-magic"></i>首页</a>
	       </li>
	       <li role="presentation"><a href="<s:url action="Article_searchArticles?keyword=hql" />" class="banner_a">编程语言</a></li>
	       <li role="presentation"><a href="<%=basePath%>/resultList.jsp?user.id=${user.id}" class="banner_a">web开发</a></li>
	       <li role="presentation"><a href="<%=basePath%>/resultList.jsp?user.id=${user.id}" class="banner_a">移动开发</a></li>
	       <li role="presentation"><a href="<%=basePath%>/resultList.jsp?user.id=${user.id}" class="banner_a">硬件开发</a></li>
	       <li role="presentation"><a href="<%=basePath%>/resultList.jsp?user.id=${user.id}" class="banner_a">数据库</a></li>
	       <li role="presentation" class="dropdown">
	         <s:if test="#session.user.username ==''||#session.user.username ==null">
                <a  target="_self" href="<%=basePath%>/login.jsp">登录</a>
		        <a  target="_self" href="<%=basePath%>/regUser.jsp">注册</a>
		     </s:if>
		     <s:else>
				<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
				  <img src="<%=basePath%>/upload/${user.img}" />
			      Hi&nbsp;, &nbsp;${session.user.username}&nbsp;, &nbsp;点这里试试<span class="caret"></span>
			    </a>
				<ul class="dropdown-menu">
				      <li>战斗值：${session.user.integtal}</li>
			         <li>个人中心</li>
			    </ul>
			 </s:else>
	       </li>
	     </ul>
     </nav>
  </header>
  <main>
    <h1>请在这里编辑你的文章</h1>
     <s:form id="writeArticle" name="writeArticle" action="Article_releaseArticle" method="POST" cssClass="edit_articles">
       <div class="form-group">
	    <label for="title"><h2>标题</h2></label>
	    <s:textfield id="tltie" name="title" cssClass="form-control"/>
	   </div>
	   <div class="form-group">
	    <label for="acontent"><h2>内容</h2></label>
	    <s:textarea id="acontent" name="acontent" cssClass="form-control" rows="28"/>
	   </div>
	   <div class="form-group">
	   
	    <input type="button" value="保存" onclick="writeArticle.action='Article_saveArticle';writeArticle.submit();"  class="btn btn-warning"/>
	    <s:submit value="发布" cssClass="btn btn-success "></s:submit>
	   </div>
	 </s:form>
    
      <s:if test="hasActionMessages()">
	    <cp:msgdialog basepath="<%=basePath%>">
	    	<s:actionmessage/>
	    </cp:msgdialog>	
	  </s:if>
  </main>	 
  </body>
</html>
