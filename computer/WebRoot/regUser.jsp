<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Trans itional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<%@taglib prefix="s" uri="/struts-tags"%>
	<%@taglib prefix="cp" uri="/computer"%>

  </head>
  
  <body><h1><br></h1>
  
  <s:form action="User_regUser" method="POST" > 
        请输入<br/>
    <hr/>
    <table  class="center_box">
           <tr> <td>邮箱：</td><td><s:textfield id="email"  name="email" /></td> </tr>  
            <tr><td>用户名：</td><td><s:textfield id="username"  name="username" /></td></tr>  
            <tr><td>密码：</td><td><s:textfield id="password"  name="password" /></td> </tr>  
            <tr><td>确认密码：</td><td><s:textfield id="again_password"  name="again_password" /></td></tr>  
            <tr><td>头像：</td><td><s:textfield id="img"  name="img" /></td></tr>  
           <tr> <td>验证码：</td><td><s:textfield id="validacode"  name="validacode" /></td></tr>  
        <tr><td> <s:submit value="提交"/> </td></tr>   
     </table>     
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
