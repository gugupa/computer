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
    
    <title>登录</title>
    	
	 <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css">
	 <link rel="stylesheet" type="text/css" href="css/styles.css"/>
	 <link rel="shortcut icon" href="images/shorticon.png"/>  
     <link rel="stylesheet" type="text/css" href="./css/login.css"/>
    
  </head>
  
  <body>
  <main class="container-fluid">
    <h1>Come on!</h1>
    <div>
        <s:form action="User_login" method="post" id="defaultForm" cssClass="form-horizontal col-lg-5  col-md-offset-3 from-login">
			  <div class="form-group">
			    <label for="email" class="col-lg-4 control-label">Email</label>
			    <div class="col-lg-8">
			      <s:textfield id="email"  name="email" cssClass="form-control" placeholder="Email" required="required"/>
			    </div>
			  </div>			  
			  <div class="form-group">
			    <label for="Password" class="col-lg-4 control-label">Password</label>
			    <div class="col-lg-8">
			      <s:password id="password"  name="password" cssClass="form-control" placeholder="Password" required="required"/>
			    </div>
			  </div>		  
			  <div class="form-group">
			    <div class="col-sm-offset-4 col-sm-3">
			      <div class="checkbox">
			        <label>
			          <input type="checkbox">下次自动登录
			        </label>
			      </div>   
			    </div>
			    <div class="col-sm-offset-1 col-sm-4">	     
			        <a href="#" class="login_forget">忘记密码？</a>
			    </div> 
			  </div>			  
			  <div class="form-group">
			    <div class="col-sm-offset-4">
			      <div class="checkbox">
			        <label>
			          <input type="checkbox">阅读并接受<a href="#" >《Cat用户协议》</a>
			        </label>
			      </div>   
			    </div>
			  </div>		  
			  <div class="form-group">
			    <div class="col-sm-offset-4 col-sm-2">
			      <s:submit value="登录" cssClass="btn btn-default login_btn"/>
			    </div>
			    <div class="col-sm-offset-2 col-sm-2 reg_btn">
			      <button class="btn btn-default" href="regUser.jsp">注册</button>
			    </div>
			  </div>
	  </s:form> 
    </div>
       
  </main> 

<script src="<%=basePath%>js/jquery.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
  
<!--<script type="text/javascript">
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
-->
<!--<script type="text/javascript">
		$(document).ready(function() {
		    $('#defaultForm')
		        .bootstrapValidator({
		            message: '请输入内容',
		            feedbackIcons: {
		                valid: 'fa fa-check',
		                invalid: 'fa fa-remove',
		                validating: 'fa fa-refresh'
		            },
		            fields: {
		                email: {
		                    message: '用户名无效',
		                    validators: {
		                        notEmpty: {
		                            message: '用户名不得为空'
		                        },
		                        stringLength: {
		                            min: 6,
		                            max: 20,
		                            message: '用户名必须在6-20个字符之间'
		                        },
		                        regexp: {
		                            regexp: /^[a-zA-Z0-9_\.]+$/,
		                            message: '用户名只能包含字母、数字、点、下划线 '
		                        }	                        
		                    }
		                },
		                password: {
		                    validators: {
		                        notEmpty: {
		                            message: '密码不得为空'
		                        },
		                        different: {
									field: email,
									message: '密码不能与用户名相同'
									},
		                    }
		                }
		            }
		        })
		});
	</script>-->
</body>
</html>
