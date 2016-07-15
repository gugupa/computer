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
        <link rel="stylesheet"  href="css/font-awesome.min.css">
	<link rel="shortcut icon" href="images/shorticon.png"/>
	
	<link rel="stylesheet" href="css/menubar.css">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/result.css">
  </head>
  
  <body>
   <%@include file="common/menubar.jsp"%>
	   
    <main class="costain">
	   <div class="result col-sm-8 col-sm-offset-1">
	         <div class="result_title">
	            <h2><c:out value="${session.tempArticle.title}"></c:out></h2>
	        </div>
	        <div class="result_info">
	            <!-- 作者名字的连接-去作者主页 -->
	            <span class="author-name"><a href="#">${session.tempArticle.user.username}</a></span>
	            <span>${session.tempArticle.uptime}</span>
	            <span>浏览34</span>
	            <span>评论0</span>
	        </div>
	        <div class="result_content">
	            <h4><c:out value="${session.tempArticle.acontent}"></c:out></h4>
	        </div>
	        
		    
	         <div>
		        <s:form action="Comment_saveComment" method="POST">
		         <div class="form-group">
		              <c:choose>
				           <c:when test="${session.user==null}">
				               <a href="#" target="_self" data-toggle="modal" data-target="#loginbox">请登录后再来评论吧</a>
				           </c:when>
				           <c:otherwise>
								 <a class="btn btn-primary" role="button" data-toggle="collapse" href="#commentbox" aria-expanded="false" aria-controls="collapseExample">
								           添加评论
								</a>
								<div class="collapse" id="commentbox">
								  <div class="well">
								    <textarea id="commentContent" name="commentContent" class="form-control writeComment" rows="4"/>在这里写下你的评论</textarea>
							        <s:submit value="提交" cssClass="btn btn-success "></s:submit>
								  </div>
								</div>
				           </c:otherwise>
			        </c:choose>	
		            
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
	    
	    <div class="author col-sm-2">
	        <div class="author-info">
	             <div class="author-img">
	                <img width="80px" height="80px" src="${session.tempArticle.user.img}"/>
	             </div>
	             <div class="author-name">${session.tempArticle.user.username}</div>
	             <div>
	                <a>${session.authorArticleAmount}文章</a>
	                <a>3关注</a>
	                <button class="btn btn-default">关注</button>
	             </div>
	        </div>
	        <div class="author-hot">
	              <div class="author-hot-title">
	                 <span>博主其他文章</span>
	                 <a>更多</a>
	              </div>
	              <div class="author-hot-list">
	                <ul> 
					    <c:forEach items="${authorArticles}" var="authorArticle"> 
						  <li >	 
							   <c:out value="${authorArticle.title}"/>         
					      </li>   
					    </c:forEach>
				   </ul>  
	              </div>
	        </div>
	    </div>    
    </main>
    
    <!-- 位于左侧浮动的积分区 -->
    <div class="credit">${session.tempArticle.credit}</div>
   
    
   <script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
  </body>
</html>
