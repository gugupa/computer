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
	<link rel="stylesheet" type="text/css" href="css/result.css">
	
  </head>
  
  <body>&nbsp; 
   <header>
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
	               <a href="<%=basePath%>/login.jsp" target="_self">登录</a>
	               <a href="<%=basePath%>/regUser.jsp" target="_self">注册</a> 
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
	   
    <main>
	   <div class="result col-sm-8 col-sm-offset-1">
	         <div class="result_title">
	            <h2><c:out value="${session.tempArticle.title}"></c:out></h2>
	        </div>
	        <div class="result_info">
	            <!-- 作者名字的连接-去作者主页 -->
	            <span class="author-name"><a href="#">${session.tempArticle.user.username}</a></span>
	            <span>${session.tempArticle.uptime}</span>
	        </div>
	        <div class="result_content">
	            <h4><c:out value="${session.tempArticle.acontent}"></c:out></h4>
	        </div>
	        
		    
	         <div>
		        <s:form action="Comment_saveComment" method="POST">
		         <div class="form-group">
				     <label for="commentContent"><h5>添加评论</h5></label>
				     <textarea id="commentContent" name="commentContent" class="form-control" rows="4"/>在这里写下你的评论</textarea>
				     <s:submit value="提交" cssClass="btn btn-success "></s:submit>
				 </div>	 
		        </s:form>
		    </div>
		    
		    <!--显示评论的板块 -->
		    <div class="comment-block">
		        <ul> 
				    <c:forEach items="${comments}" var="comment"> 
					  <li class="comment-view">	 
					     <div class="comment-info">
						       <c:out value="${comment.senderId}"/>         
					     </div> 
					     <div class="comment-content"> 
						      <c:out value="${comment.commentContent}"/>
						 </div> 	   
				      </li>   
				    </c:forEach>
			   </ul>          
		        
		    </div>
        </div>
	    
	    <!-- 这一部分还没有完善 没有从数据库里取出对应内容 -->
	    <div class="author col-sm-2">
	        <div class="author-info">
	             <div>
	               <span><img src="#"/></span>
	               <span>${session.tempArticle.user.username}</span>
	             </div>
	             <div>
	                <button class="btn btn-default">关注</button>
	                <a>73篇文章</a>
	                <a>3关注</a>
	             </div>
	        </div>
	        <div class="author-hot">
	              <div class="author-hot-title">
	                 <span>博主其他文章</span>
	                 <a>更多</a>
	              </div>
	              <div class="author-hot-list">
	                 <ul>
	                    <li>假装这里有文章</li>
	                    <li>假装这里有文章</li>
	                    <li>假装这里有文章</li>
	                    <li>假装这里有文章</li>
	                    <li>假装这里有文章</li>
	                    <li>假装这里有文章</li>
	                 </ul>
	              </div>
	        </div>
	    </div>
	    
	    
	    
    </main>
    
    <!-- 位于左侧浮动的积分区 -->
    <div class="credit">${session.tempArticle.credit}</div>
   
    
 
  </body>
</html>
