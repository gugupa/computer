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
  <header>
      <nav class="banner">
	     <ul class="nav nav-pills">
	       <li role="presentation" class="banner_home">
	           <a href="index.jsp?user.id=${user.id}" class=" banner_a">
	                <i class="fa fa-home"></i>
	           </a>
	       </li>
	       <li role="presentation"><a href="#" onClick="getResult('编程语言')"class="banner_a">编程语言</a></li>
	       <li role="presentation"><a href="#" onClick="getResult(text)" class="banner_a">web开发</a></li>
	       <li role="presentation"><a href="#" onClick="getResult()" class="banner_a">移动开发</a></li>
	       <li role="presentation"><a href="#" onClick="getResult()"class="banner_a">硬件开发</a></li>
	       <li role="presentation"><a href="#" onClick="getResult()"class="banner_a">数据库</a></li>
	        <li role="presentation">
	              <div class="add_article_button  col-md-2">
			            <a class="btn btn-default" target="_self" href="<%=basePath%>/writeArticle.jsp">
			            <i class="fa fa-tag"></i>&nbsp;添加博文
			            </a>
			     </div>
	        </li>
	        <li role="presentation">
	              <div class="search_box">
				        <s:form action="Article_searchArticles" method="post" cssClass="form-inline">
						    <div class="input-group">
						      <s:textfield name="keyword" id="exampleInputAmount" cssClass="form-control search_input"/>
						      <span class="input-group-btn search-icon">
						        <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
						      </span>
						    </div>
					    </s:form>
				    </div>
	        </li>
	       <li role="presentation" class="dropdown">	       
	        <c:choose>
	           <c:when test="${session.user==null}">
	              <div class="login-reg">
	                 <a href="#" target="_self" data-toggle="modal" data-target="#loginbox">登录</a>
	                 <a href="<%=basePath%>/regUser.jsp" target="_self">注册</a> 
	              </div> 
	           </c:when>
	           <c:otherwise>
	                <a class="dropdown-toggle user-state" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						<img src="<%=basePath%>/upload/${user.img}" />
					    ${session.user.username}<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
					        <li><a href="Person.jsp" target="_self">个人中心</a></li>
					        <li><a href="#" target="_self">注销</a></li>
					 </ul>
	           </c:otherwise>
	        </c:choose>
	       </li>
	       
	     </ul>
     </nav>
     
  </header>
  <main class="contain">      
    <div>
       <iframe id="mainframe" src="Article_browseArticlesByPage?page=1" name="mainframe"  scrolling="auto" width="1014px" class="mainframe"></iframe>  
    </div>
  </main>
  
  <!-- 用于登录的模态框 -->
   <div id="loginbox" class="modal fade"  tabindex="-1" role="dialog">
     <div class="modal-dialog  modal-sm" role="document">
       <div class="modal-content">
         <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
             <h4 class="modal-title">登录到Cat</h4>
         </div>
         <div class="modal-body"> 
	        <s:form action="User_login" method="post" cssClass="form-horizontal from-login">
				  <div class="form-group">
				    <label for="email" class="col-lg-3 control-label"><i class="fa fa-user fa-ul"></i></label>
				    <div class="col-lg-9">
				      <s:textfield id="email_username"  name="email_username" cssClass="form-control" placeholder="邮箱/昵称" required="required"/>
				    </div>
				  </div>			  
				  <div class="form-group">
				    <label for="Password" class="col-lg-3 control-label"><i class="fa fa-key fa-ul"></i></label>
				    <div class="col-lg-9">
				      <s:password id="password"  name="password" cssClass="form-control" placeholder="密码" required="required"/>
				    </div>
				  </div>		  
				  <div class="form-group">
				    <div class="col-sm-offset-3 col-sm-5">
				      <div class="checkbox">
				        <label>
				          <input type="checkbox">下次自动登录
				        </label>
				      </div>   
				    </div>
				    <div class=" col-sm-4">	     
				        <a href="#" class="login_forget">忘记密码？</a>
				    </div> 
				  </div>			  
			</div><!-- modal-body -->	  		  
				  <div class="form-group modal-footer">
				    <div class="col-sm-offset-2 col-sm-3">
				      <s:submit value="登录" cssClass="btn btn-primary login_btn"/>
				    </div>
				    <div class="col-sm-offset-2 col-sm-3 reg_btn">
				      <button class="btn btn-default" href="regUser.jsp">注册</button>
				    </div>
				  </div>
		    </s:form> 
		 
	  </div>
	</div>
   </div>
   
   <script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="js/bootstrapValidator.js"></script> 
  </body>
</html>
