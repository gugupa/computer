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
    
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
	<link rel="shortcut icon" href="images/shorticon.png"/>
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">
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
	   
    <main class="result">
        <div class="result_title">
            <h2><c:out value="${session.tempArticle.title}"></c:out></h2>
        </div>
        <div class="result_content">
            <h4><c:out value="${session.tempArticle.acontent}"></c:out></h4>
        </div>
    </main>

 
  </body>
</html>
