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
  
    <title>个人中心</title>
    
    <link rel="stylesheet"  href="css/bootstrap.min.css">
    <link rel="stylesheet"  href="css/font-awesome.min.css">
    <link rel="shortcut icon" href="images/shorticon.png" />
    
	<link rel="stylesheet" href="css/styles.css">
	<link rel="stylesheet" href="css/person.css">
	
	
  </head>
      
  <body>
	 <div class="col-md-2 person-info">
	     <div class="person-baseinfo">
	        <img src="${user.img}"/>
	        <p>${user.username}</p>
	        <p>积分&nbsp;${user.integtal}</p>
	        <p>入驻时间&nbsp;${user.rdate}</p>
	     </div>
	 </div>
	 <div class="col-md-10">
	  <ul class="nav  person-nav mt-5" role="tablist">
	    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab" class="person-nav-a">主页</a></li>
	    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab" class="person-nav-a">设置</a></li>
	  </ul>

	  <div class="tab-content">
	    <div role="tabpanel" class="tab-pane active" id="home">
	       <div class="panel panel-default mt-5">
			  <div class="panel-body ">
			    <h4>最近动态</h4>
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
	    <div role="tabpanel" class="tab-pane" id="settings">
			  <a class="btn btn-default" href="editUser.jsp">修改资料</a>
	    </div>
	  </div>	
	</div>
   <script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
  </body>
</html>
