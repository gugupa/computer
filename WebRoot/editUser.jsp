<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人资料</title>
    
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/person.css">
	<link rel="shortcut icon" href="images/shorticon.png"/>	
	
	<%@taglib prefix="s" uri="/struts-tags"%>
	<%@taglib prefix="cp" uri="/computer"%>

  </head>
  
  <body>
	  <header>
	      <h2 class="col-sm-offset-5">修改个人信息</h2>
	  </header>
   
  
    <s:form action="User_editUser" method="POST" enctype="multipart/form-data" cssClass="form-horizontal reg-form"> 
	    <div class="form-group reg-form-row">
	          <label for="email" class="control-label col-sm-4">邮箱</label>
	          <div class="col-sm-5">
	             <input type="email" id="email"  name="email" value="${session.user.email}" class="form-control"  autocomplete="off"/>
	          </div>
	     </div>
	     <div class="form-group reg-form-row">
	          <label for="username" class="control-label col-sm-4" >用户名</label>
	           <div class="col-sm-5">
	             <input type="text" id="username" name="username" value="${session.user.username}" class="form-control" autocomplete="off"/>
	           </div>
	     </div>
	      <div class="form-group reg-form-row">
	          <label for="password" class="control-label col-sm-4">密码</label>
	           <div class="col-sm-5">
	             <input type="text" id="password" name="password" value="******"  class="form-control" disabled/>
	           </div>
	       </div>
	      <div class="form-group reg-form-row">
	          <label for="image" class="control-label col-sm-4">头像</label>
	           <div class="col-sm-5">
	           <div class="fileupload fileupload-new" data-provides="fileupload">
                                  <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                    <img src="<%=basePath%><s:property value='session.user.img'/>" alt="" />
                                  </div>
                                  <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height:150px; line-height: 20px;">
                                  </div>
                                  <div>
                                      <span class="btn btn-file btn-primary">
                                         <span class="fileupload-new">换张图片</span>
                                         <span class="fileupload-exists">换张图片</span>
                                         <input type="file" name="image"/>
                                      </span>
                                      <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">取消</a>
                                  </div>
                              </div>
	           </div>
	       </div>
	       <div class="form-group reg-form-row">
	          <label for="image" class="control-label col-sm-4">验证码</label>
	           <div class="col-sm-5">
	            <input  id="validacode" name="validacode" class="form-control"/>
	           </div>
	       </div>
	       
	     
	      
	          <s:submit value="提交" cssClass="btn btn-primary col-sm-offset-5" />
   
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
	<script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-fileupload.js"></script>
   <script src="js/bootstrapValidator.js"></script>
  </body>
</html>   