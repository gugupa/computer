<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.UserDaoImpl"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="dao.UserDao"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
    <link rel="stylesheet"  href="css/font-awesome.min.css">
	<link rel="shortcut icon" href="images/shorticon.png"/>
	
	<link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css">
		
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/regUser.css">	
	
	<%@taglib prefix="s" uri="/struts-tags"%>
	<%@taglib prefix="cp" uri="/computer"%>




 <script>  
        $(document).ready(function(){
             $('#reg-form').bootstrapValidator({
                  message:'请输入内容',
                  feedbackIcons:{
                      valid:'fa fa-check',
                      invalid:'fa fa-remove',
                      validating:'fa fa-refresh'
                  },
                  fields:{
                     'username':{
                         message:'用户名无效',
                         validators:{
                            notEmpty:{
                                message:'用户名不得为空'
                            },
                            stringLength:{
                               min:6,
                               max:20,
                               message:'用户名必须在1-11个字符之间'                           
                            },
                            regexp:{
                               regexp:/^[a-zA-Z0-9_\.]+$/,
                               message:'用户名只能包含字母、数字、点、下划线'
                            }
                         }
                     
                     },
                     'password':{
                         validators:{
                              notEmpty:{
                                  message:'密码不得为空'
                              }                         
                         }
                     }
                  }
             })
        }
        );
 </script>  
 
  
    
  </head>
  
  <body>
     <h2 >注册信息<small>我们需要以下信息以更好地为您提供服务</small></h2>
     
	 <s:form id="reg-form" action="User_regUser" method="POST" enctype="multipart/form-data" cssClass="form-horizontal reg-form"> 
	     <div class="form-group reg-form-row">
	          <label for="email" class="control-label col-sm-4">邮箱</label>
	          <div class="col-sm-5">
	             <input type="email" id="email" name="email" class="form-control" placeholder="填写常用邮箱">
	          </div>
	     </div>
	     <div class="form-group reg-form-row">
	          <label for="username" class="control-label col-sm-4">昵称</label>
	           <div class="col-sm-5">
	             <input type="text"  name="username" class="form-control" placeholder="如：pubby"/>
	           </div>
	       </div>
	       
	      <div class="form-group reg-form-row">
	          <label for="password" class="control-label col-sm-4">密码</label>
	           <div class="col-sm-5">
	              <input type="password" id="password" name="password" class="form-control" placeholder="密码（6~16个字符，区分大小写）" required/>
	           </div>      
	       </div>
	       
	       <div class="form-group reg-form-row">
	          <label for="again_password" class="control-label col-sm-4">确认密码</label>
	           <div class="col-sm-5">
	              <input type="password" id="again_password" name="again_password" class="form-control" placeholder="再次输入密码"/>
	           </div>      
	       </div>
	      <div class="form-group reg-form-row">
	          <label for="image" class="col-sm-4 control-label">头像</label>
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
	      <div class="form-group reg-form-row">
	          <label for="validacode" class="control-label col-sm-4">验证码</label>
	          <div class="col-sm-3">
	             <s:textfield  id="validacode" name="validacode" cssClass="form-control"/>
	          </div>
	      </div>
	    <p><s:submit value="提交" cssClass="btn btn-primary col-sm-offset-5"/></p>	   
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
