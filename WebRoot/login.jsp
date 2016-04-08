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
     
  </head>
  
  <body>
  <main class="center_box" >
    <s:form action="User_login" methtod="post" cssClass="form-horizontal col-sm-8">
		
		  <div class="form-group">
		    <label for="email" class="col-sm-4 control-label">邮箱</label>
		    <div class="col-sm-8">
		      <s:textfield id="email"  name="email" class="form-control" placeholder="Email"/>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="Password" class="col-sm-4 control-label">密码</label>
		    <div class="col-sm-8">
		      <s:password id="password"  name="password" class="form-control" placeholder="Password"/>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <div class="checkbox">
		        <label>
		          <input type="checkbox">记住密码
		        </label>
		      </div>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <s:submit value="登录" class="btn btn-default"/>
		    </div>
		  </div>
  </s:form> 
    
    
      <!--<table class="center_box">
       <tr><td><label>邮箱</label></td><td><s:textfield id="email"  name="email"/></td></tr>
        <tr><td><label>密码</label></td><td><s:password id="password"  name="password"/></td></tr>
        <tr><td><input type="button" value="注册" /></td><td><s:submit value="登录"/></td></tr>
      </table>-->
        
  </main> 
                   
</body>
</html>
