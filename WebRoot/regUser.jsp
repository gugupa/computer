<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
	<link rel="shortcut icon" href="images/shorticon.png"/>
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<%@taglib prefix="s" uri="/struts-tags"%>
	<%@taglib prefix="cp" uri="/computer"%>

  </head>
  
  <body>
    <h1>注册信息<h1>
    <h2>我们需要以下信息以更好地为您提供服务</h2>

    <s:form action="User_regUser" method="POST" enctype="multipart/form-data"> 
	    <ul>
	       <li>
	          <label for="email">邮箱</label>
	          <s:textfield id="email"  name="email"/>
	       </li>
	       <li>
	          <label for="username">用户名</label>
	          <s:password id="username" name="username"/>
	       </li>
	       <li>
	          <label for="password">密码</label>
	          <s:password id="password" name="password"/>
	       </li>
	       <li>
	          <label for="again_password">确认密码</label>
	          <s:textfield  id="again_password" name="again_password"/>
	       </li>
	       <li>
	          <label for="img">头像</label>
	          <s:file  name="img"/>
	       </li>
	       <li>
	          <label for="validacode">验证码</label>
	          <s:textfield  id="validacode" name="validacode"/>
	       </li>
	       <li>
	          <s:submit value="提交"/>
	       </li>
	    </ul>	   
	 </s:form>
	 
	 
	 
	 
      <s:if test="hasFieldErrors()">
	    <cp:msgdialog basepath="<%=basePath%>">
	    	<s:fielderror/>
	    </cp:msgdialog>	
	    </s:if>
	  <s:if test="hasActionMessages()">
	    <cp:msgdialog basepath="<%=basePath%>">
	    	<s:actionmessage/>
	    </cp:msgdialog>	
	  </s:if>
	    
  </body>
</html>
