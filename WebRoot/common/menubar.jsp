<%@ page contentType="text/html; charset=utf-8"%>
<header>
      <nav class="banner">
	     <ul class="nav nav-pills">
	       <li role="presentation" class="banner_home">
	           <a href="index.jsp?user.id=${user.id}" class=" banner_a">
	                <img src="images/shorticon.png" width="40px;" height="40px;"/>
	           </a>
	       </li>
	       <li role="presentation"><a  href="Article_searchArticles?keyword=编程语言&ie=utf-8" class="banner_a">编程语言</a></li>
	       <li role="presentation"><a  href="Article_searchArticles?keyword=WEB开发&ie=utf-8" class="banner_a">WEB开发</a></li>
	       <li role="presentation"><a  href="Article_searchArticles?keyword=移动开发&ie=utf-8" class="banner_a">移动开发</a></li>
	       <li role="presentation"><a  href="Article_searchArticles?keyword=硬件开发&ie=utf-8" class="banner_a">硬件开发</a></li>
	       <li role="presentation"><a  href="Article_searchArticles?keyword=数据库&ie=utf-8" class="banner_a">数据库</a></li>
	       <li role="presentation" class="dropdown">
		        <c:choose>
			           <c:when test="${session.user==null}">
			           </c:when>
			           <c:otherwise>
							 <div class="add_article_button">
					            <a class="btn btn-default" target="_blank" href="writeArticle.jsp">
					                <i class="fa fa-tag"></i>&nbsp;添加博文
					            </a>
					        </div>
			           </c:otherwise>
		        </c:choose>	  
	        </li>
	        <li role="presentation">
	              <div class="search_box">
				        <s:form action="Article_searchArticles?page=1" method="post" cssClass="form-inline">
						    <div class="input-group">
						      <s:textfield name="keyword" id="exampleInputAmount" cssClass="form-control search_input"/>
						      <span class="input-group-btn search-icon">
						        <button class="btn btn-primary btn-search" type="submit"><i class="fa fa-search"></i></button>
						      </span>
						    </div>
					    </s:form>
				    </div>
	        </li>
	       <li role="presentation" class="dropdown">	       
	        <c:choose>
	           <c:when test="${session.user==null}">
	              <div class="login-reg">
	                 <a href="#" target="_self" data-toggle="modal" data-target="#loginbox">登录</a>
	                 <a href="regUser.jsp" target="_blank">注册</a> 
	              </div> 
	           </c:when>
	           <c:otherwise>
	                <a class="dropdown-toggle user-state" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						<img width="40" height="40" src="${user.img}" />
					    ${user.username}<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
					        <li><a href="Person.jsp" target="_self">个人中心</a></li>
					        <li><a href="User_quit" target="_self">注销</a></li>
					 </ul>
	           </c:otherwise>
	        </c:choose>
	       </li>
	        
	     </ul>
     </nav>
     
  </header>
  
    <!-- 用于登录的模态框 -->
   <div id="loginbox" class="modal fade"  tabindex="-1" role="dialog">
     <div class="modal-dialog  modal-sm" role="document">
       <div class="modal-content model-box">
         <div class="modal-header model-box-header">
             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
             <h4 class="modal-title">登录到Cat</h4>
         </div>
         <div class="modal-body model-box-body"> 
	        <s:form action="User_login" method="post" cssClass="form-horizontal from-login">
				  <div class="form-group">
				    <label for="email" class="col-lg-3 control-label"><i class="fa fa-user fa-ul"></i></label>
				    <div class="col-lg-9">
				      <s:textfield id="email_username"  name="email_username" cssClass="form-control" placeholder="邮箱/昵称" required="required"/>
				    </div>
				  </div>			  
				  <div class="form-group">
				    <label for="Password" class="col-lg-3 control-label"><i class="fa fa-key fa-ul"></i></label>
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
			</div> 		  
				  <div class="form-group modal-footer model-box-footer">
				    <div class="col-sm-offset-2 col-sm-3">
				      <s:submit value="登录" cssClass="btn btn-default login_btn"/>
				    </div>
				    <div class="col-sm-offset-2 col-sm-3 reg_btn">
				      <a class="btn btn-default" href="/computer/regUser.jsp">注册</a>
				    </div>
				  </div>
		    </s:form> 
		 
	  </div>
	</div>
   </div>