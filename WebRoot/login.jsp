<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    	
	 <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="./css/styles.css"/>
	 <link rel="shortcut icon" href="images/shorticon.png"/>
     <%@taglib prefix="s" uri="/struts-tags"%>
     
     <link rel="stylesheet" type="text/css" href="./css/login.css"/>
     
  </head>
  
  <body>
  l<main class="container-fluid">
    <s:form action="User_login" methtod="post" cssClass="form-horizontal col-lg-5  col-md-offset-3 from_login">
		
		  <div class="form-group">
		    <label for="email" class="col-lg-4 control-label">邮箱</label>
		    <div class="col-lg-8">
		      <s:textfield id="email"  name="email" cssClass="form-control" placeholder="Email"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="Password" class="col-lg-4 control-label">密码</label>
		    <div class="col-lg-8">
		      <s:password id="password"  name="password" cssClass="form-control" placeholder="Password"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4 col-sm-3">
		      <div class="checkbox">
		        <label>
		          <input type="checkbox">记住密码
		        </label>
		      </div>   
		    </div>
		    <div class="col-sm-offset-1 col-sm-4">	     
		        <a href="#" class="login_forget">忘记密码？</a>
		    </div> 
		    
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4 col-sm-2">
		      <s:submit value="登录" cssClass="btn btn-default login_btn"/>
		    </div>
		    <div class="col-sm-offset-2 col-sm-2 reg_btn">
		      <button class="btn btn-default">注册</button>
		    </div>
		  </div>
  </s:form>    
  </main> 
                   
</body>
</html>
