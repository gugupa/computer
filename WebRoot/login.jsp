<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%> 
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Cat-登录</title>
    	
	 <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	 <link rel="stylesheet"  href="css/font-awesome.min.css">
	 <link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css">
	 <link rel="stylesheet" type="text/css" href="css/styles.css"/>
	 <link rel="shortcut icon" href="images/shorticon.png"/>  
  </head>
  
  <body>
   <main class="contain">
    <div class="login">
       <div class="logo">
          <a href="index.jsp"><img src="images/shorticon.png" style="width:80px;height:80px;" class="img-thumbnail img-circle"/></a>
       </div>
        <s:form action="User_login" method="post" cssClass="form-horizontal from-login">
				  <div class="form-group">
				    <label for="email_username" class="col-lg-3 control-label"><i class="fa fa-user fa-ul"></i></label>
				    <div class="col-lg-9">
				      <s:textfield id="email_username"  name="email_username" cssClass="form-control" placeholder="邮箱/昵称" required="required"/>
				    </div>
				  </div>			  
				  <div class="form-group">
				    <label for="password" class="col-lg-3 control-label"><i class="fa fa-key fa-ul"></i></label>
				    <div class="col-lg-9">
				      <s:password id="password"  name="password" cssClass="form-control" placeholder="密码" required="required"/>
				    </div>
				  </div>		  
				  <div class="form-group">
				    <div class="col-md-offset-2 col-md-5">
				      <div class="checkbox">
				        <label>
				          <input type="checkbox">记住密码
				        </label>
				      </div>   
				    </div>
				    <div class="col-md-4">	     
				        <a href="#" class="btn btn-link">忘记密码？</a>
				    </div> 
				  </div>			  		  
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-3">
				      <s:submit value="登录" cssClass="btn btn-default"/>
				    </div>
				    <div class="col-sm-offset-2 col-sm-3">
				      <a class="btn btn-default" href="/computer/regUser.jsp">注册</a>
				    </div>
		</s:form> 
     </div>
  </main> 

<script src="<%=basePath%>js/jquery.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
  
<script type="text/javascript">
        $(document).ready(function(){
           $('#form-login')
           .bootstrapValidator({
                     message:'用户名或密码不能为空',
                     feedbackIcons:{
                           valid:'fa fa-ul fa-check',
                           invalid:'fa fa-remove',
                           validating:'fa fa-refreh'
                     },
                     fields:{
                           email:{
                                message:'邮箱无效',
                                validators:{
                                    notEmpty:{
                                        message:'邮箱不得为空'
                                    },
                                    stringLength：{
                                        min:6,
                                        max:20,
                                        message：'用户名必须在6-20个字符之间'
                                    },
                                    regexp：{
                                        regexp: /^[a-zA-Z0-9_\.]+$/ ,
                                        message:'用户名只能包含字母、数字、点、下划线' 
                                    }
                                }
                           },
                           password:{
                                   validators：{
                                       notEmpty：{
                                            message:'密码不得为空'
                                       },
                                       different:{
                                            field:email,
                                            message:'密码不能与用户名相同'
                                       }
                                   }
                           }
                     }
               });
        });
     </script>     

</body>
</html>
