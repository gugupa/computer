<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>文章列表</title>
    
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="shortcut icon" href="images/shorticon.png"/>
    <link rel="stylesheet"  href="css/styles.css">
    <link rel="stylesheet"  href="css/resultList.css">
    
    <script src="js/jquery.min.js" ></script>
    <script src="js/bootstrap.min.js" ></script>
    <script src="js/jquery.dotdotdot.js" ></script>
    
    
	<script type="text/javascript">

    $(document).ready(function() {
	    $(".dot-ellipsis").dotdotdot({
	       		/*	The text to add as ellipsis. */
			ellipsis	: 'ww',
		
			/*	How to cut off the text/html: 'word'/'letter'/'children' */
			wrap		: 'letter',
		
			/*	Wrap-option fallback to 'letter' for long words */
			fallbackToLetter: false,
		
			/*	jQuery-selector for the element to keep and put after the ellipsis. */
			after		: null,
		
			/*	Whether to update the ellipsis: true/'window' */
			watch		: false,
		
			/*	Optionally set a max-height, can be a number or function.
				If null, the height will be measured. */
			height		: null,
		
			/*	Deviation for the height-option. */
			tolerance	: 0,
		
			/*	Callback function that is fired after the ellipsis is added,
				receives two parameters: isTruncated(boolean), orgContent(string). */
			callback	: function( isTruncated, orgContent ) {},
		
			lastCharacter	: {
		
				/*	Remove these characters from the end of the truncated text. */
				remove		: [ ' ', ',', ';', '.', '!', '?' ],
		
				/*	Don't add an ellipsis if this array contains 
					the last character of the truncated text. */
				noEllipsis	: []
			}
	    });
	});

   


	</script>
	
    
  </head>
  
  <body>
   
   <ul> 
    <c:forEach items="${articles}" var="article"> 
	  <li class="resultList">	 
	     <div class="rslist_title">
		    <a href="Article_loadArticle?id=${article.articleId}" target="_blank">
		       <c:out value="${article.title}"/>
		    </a>          
	     </div> 
	     <div class="rslist_acontent"> 
		    <a class="rslist_acontent" href="Article_loadArticle?id=${article.articleId}" target="_blank">
		      <div class="dot-ellipsis dot-height-60">
		        <c:out value="${article.acontent}"/>
		      </div>
		    </a>
		 </div> 	   
      </li>   
    </c:forEach>
   </ul> 
  
   <footer class="page-turn"> 
		  <c:choose>
		     <c:when test="${listSize==0}">
		        <p>很遗憾，没有相关结果.....</p>
		     </c:when>
		     <c:otherwise>
		          <ul class="pagination">
				    <li>
				      <a href="" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <c:forEach var="i" begin="1" end="${(listSize-listSize%10)/10+1}" step="1">
				       <li><a href="Article_browseArticlesByPage?page=<c:out value="${i}"/>"><c:out value="${i}"/></a></li>
					</c:forEach>					
				    <li>
				      <a href="" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
		     </c:otherwise>
		  </c:choose>
     </footer>
  </body>
</html>
