<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="keyword.Keyword_constants" %>
<%@ page import="keyword.Keyword_category" %>
<%@ page import="keyword.Keyword_score" %>

     
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <style type="text/css">
      body {
        padding-top: 20px;
        padding-bottom: 40px;
      }

      /* Custom container */
      .container-narrow {
        margin: 0 auto;
        max-width: 700px;
      }
      .container-narrow > hr {
        margin: 30px 0;
      }

      /* Main marketing message and sign up button */
      .jumbotron {
        margin: 60px 0;
        text-align: center;
      }
      .jumbotron h1 {
        font-size: 72px;
        line-height: 1;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
      }

      /* Supporting marketing content */
      .marketing {
        margin: 60px 0;
      }
      .marketing p + h4 {
        margin-top: 28px;
      }

      .searchline {
        margin: 60px 0;
        text-align: center;
        margin-top: 30px;
      }
      

    </style>

    <title>Big Movie</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="upms-bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
  </head>
  <body>
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <script>
          	function return_back() {
          		window.history.back(-1);
          	}
          </script>
          <a class="brand" herf="#" onclick="return_back()">Big Movie</a>

        </div>
      </div>
    </div>
    

        <div class="container">

       <div class="jumbotron">
        <h1>Super Movie Recommendation</h1>
        <p class="lead">Awsome move recommendation, classification and key words search for
          both movie lovers and movie producers!
        </p>
      </div>
      
	  <div class="container-fluid">
	      <div class="row-fluid">
	        <div class="span3">
	          <div class="well sidebar-nav">
	            <ul class="nav nav-list">
	              <li class="nav-header">hot</li>
	              <li class="active"><a href="#">exiting</a></li>
	              <li><a href="category.jsp?category=action">action</a></li>
	              <li><a href="category.jsp?category=adventure">adventure</a></li>
	              <li><a href="category.jsp?category=science">science/fiction</a></li>
	              <li class="nav-header">hot</li>
	              <li><a href="category.jsp?category=crime">crime</a></li>
	              <li><a href="category.jsp?category=drama">drama</a></li>
	              <li><a href="category.jsp?category=historical">historical</a></li>
	              <li><a href="category.jsp?category=horror">horror</a></li>
	              <li class="nav-header">classic</li>
	              <li><a href="category.jsp?category=war">war</a></li>
	              <li><a href="category.jsp?category=romatic">romantic</a></li>              
	              <li><a href="category.jsp?category=comedy">comedy</a></li>
	              <li><a href="category.jsp?category=musical">musical/dance</a></li>
	            </ul>
	          </div><!--/.well -->
	        </div><!--/span-->
	        <div class="span9">
	          <div class="hero-unit">
            	<h1>Hello, <%= session.getAttribute("username")%>!</h1>
            	<p>You can use up to ten key words as you like.</p>
          	  </div>
	          	  <div class="row-fluid">
		        	<form action="handle_key_word.jsp">
		        	   <div class="span4" action="handlepredict.jsp">
			        		<li><input type="checkbox" name=adventure>adventure</input></li>
			        		<li><input type="checkbox" name="blackmail">blackmail</input></li>
			        		<li><input type="checkbox" name=cartoon>cartoon</input></li>
			        		<li><input type="checkbox" name="chaplin">chaplin</input></li>
			        		<li><input type="checkbox" name=disney>disney</input></li>
			        		<li><input type="checkbox" name="empires">empires</input></li>
			        		<li><input type="checkbox" name=Epics>Epics</input></li>
			        		<li><input type="checkbox" name="gangsters">gangsters</input></li>
			        		<li><input type="checkbox" name=ghosts>ghosts</input></li>
			        		<li><input type="checkbox" name="horseback">horseback</input></li>
		        		</div>
		        		<div class="span4">
			        		<li><input type="checkbox" name="kungfu">kungfu</input></li>
			        		<li><input type="checkbox" name="legendary">legendary</input></li>
			        		<li><input type="checkbox" name="light-hearted">light-hearted</input></li>
			        		<li><input type="checkbox" name="musical">musical</input></li>
			        		<li><input type="checkbox" name="poppins">poppins</input></li>
			        		<li><input type="checkbox" name="relish">relish</input></li>
			        		<li><input type="checkbox" name="strength">strength</input></li>
			        		<li><input type="checkbox" name="workout">workout</input></li>
			        		<li><input type="checkbox" name="zombie">zombie</input></li>
			        		<li><input type="checkbox" name="flood">flood</input></li>
		        		</div>
		        		<div class="span4">
			        		<li><input type="checkbox" name="historical">historical</input></li>
			        		<li><input type="checkbox" name="mathematician">mathematician</input></li>
			        		<li><input type="checkbox" name="monarchy">monarchy</input></li>
			        		<li><input type="checkbox" name="monsters">monsters</input></li>
			        		<li><input type="checkbox" name="planets">planets</input></li>
			        		<li><input type="checkbox" name="prince">prince</input></li>
			        		<li><input type="checkbox" name="spy">spy</input></li>
			        		<li><input type="checkbox" name="supernatural">supernatural</input></li>
			        		<li><input type="checkbox" name="triumphs">triumphs</input></li>
			        		<li><input type="checkbox" name="vies">vies</input></li>
		        		</div>
		        		<button class="searchline" type="submit">submit</button>
		        	</form>
		        </div>

	        </div>
	        
	      </div><!--/row-->

      <hr>

      <footer>
        <p>&copy; Company 2013</p>
      </footer>

    </div><!--/.fluid-container-->


      <form action="" method="get" name="frm"> 
      <div id = "movie_item_list">
        
      </div>
      <hr>
  </form>
      <footer>
        <p>&copy; Columbia University 2014 fall Media</p>
      </footer>

    </div> <!-- /container -->
    <script src="upms-bootstrap/js/jquery.js"></script>
    <script src="upms-bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>