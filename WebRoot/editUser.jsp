<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人资料</title>
    
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	
	<link rel="shortcut icon" href="images/shorticon.png"/>	
	
	<%@taglib prefix="s" uri="/struts-tags"%>
	<%@taglib prefix="cp" uri="/computer"%>

  </head>
  
  <body>
  
    <s:form action="User_editUser" method="POST" enctype="multipart/form-data"> 
	    <ul>
	       <li>
	          <label for="email">邮箱</label>
	          <s:textfield id="email"  name="email" value="${session.user.email}"/>
	       </li>
	       <li>
	          <label for="username">用户名</label>
	          <s:textfield id="username" name="username" value="${session.user.username}"/>
	       </li>
	       <li>
	          <label for="password">密码</label>
	          <s:textfield id="password" name="password" value="***" disabled/>
	       </li>
	       <li>
	          <label for="image">头像</label>
	          <s:file id="image"  name="image" value="${session.user.img}"/>
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