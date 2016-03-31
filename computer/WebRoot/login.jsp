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
    
	<link rel="stylesheet" type="text/css" href="./css/styles.css"/>
	
     <%@taglib prefix="s" uri="/struts-tags"%>
     
  </head>
  
  <body>

    <div  >
      <s:form action="User_login" methtod="post">
      <table class="center_box">
       <tr><td><label>邮箱</label></td><td><s:textfield id="email"  name="email"/></td></tr>
        <tr><td><label>密码</label></td><td><s:password id="password"  name="password"/></td></tr>
        <tr><td><input type="button" value="注册" /></td><td><s:submit value="登录"/></td></tr>
      </table>
        
        
                   
          
     </s:form>
    </div>

  </body>
</html>
