<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="keyword.Keyword_constants" %>
<%@ page import="keyword.Keyword_category" %>
<%@ page import="keyword.Keyword_score" %>
<%@ page import="java.util.Vector" %>
<%@ page import="big_movie_web.Data_processor" %>
<%@ page import ="Recommender.Recommend_movie" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
 	String adventure = request.getParameter("adventure");
 	String blackmail = request.getParameter("blackmail");
 	String cartoon = request.getParameter("cartoon");
 	String chaplin = request.getParameter("chaplin");
 	String disney = request.getParameter("disney");
 	String empires = request.getParameter("empires");
 	String Epics = request.getParameter("Epics");
 	String gangsters = request.getParameter("gangsters");
 	String ghosts = request.getParameter("ghosts");
 	String horseback = request.getParameter("horseback");
 	String kungfu = request.getParameter("kungfu");
 	String legendary = request.getParameter("legendary");
 	String light_hearted = request.getParameter("light-hearted");
 	String musical = request.getParameter("light-hearted");
 	String poppins = request.getParameter("poppins");
 	String relish = request.getParameter("relish");
 	String strength = request.getParameter("strength");
 	String workout = request.getParameter("workout");
 	String zombie = request.getParameter("zombie");
 	String flood = request.getParameter("flood");
 	String historical = request.getParameter("historical");
 	String mathematician = request.getParameter("mathematician");
	String monarchy = request.getParameter("monarchy");
 	String monsters = request.getParameter("monsters");
 	String planets = request.getParameter("planets");
 	String prince = request.getParameter("prince");
 	String spy = request.getParameter("spy");
 	String supernatural = request.getParameter("spy");
 	String triumphs = request.getParameter("spy");
 	String vies = request.getParameter("spy");
 	
 	float current_rate = 0;
 	
 	int count = 0;
 	Keyword_score key_score = new Keyword_score();
 	if (adventure != null) {
 		Keyword_category keword = new Keyword_category(2,5,0,0,0,0,0,0,0,2,0);
 		key_score.sum_key_word(keword);
 	}
	if (blackmail != null) {
 		Keyword_category keword = new Keyword_category(1,0,0,4,0,0,2,0,0,0,0);
 		key_score.sum_key_word(keword);
 	}
	if (cartoon != null) {
 		Keyword_category keword = new Keyword_category(0,0,4,0,2,0,0,0,0,0,1);
 		key_score.sum_key_word(keword);
 	}
	 if ( chaplin != null) {
 		Keyword_category keword = new Keyword_category(4,0,5,0,2,0,0,0,0,0,1);
 		key_score.sum_key_word(keword);
 	}
	if ( disney != null) {
 		Keyword_category keword = new Keyword_category(0,0,5,0,0,0,0,4,0,0,4);
 		key_score.sum_key_word(keword);
 	}
	if ( empires != null) {
 		Keyword_category keword = new Keyword_category(0,1,0,0,0,4,0,0,0,1,0);
 		key_score.sum_key_word(keword);
 	}
	if ( Epics != null) {
 		Keyword_category keword = new Keyword_category(0,1,0,0,0,4,0,0,0,0,0);
 		key_score.sum_key_word(keword);
 	}
	if ( gangsters != null) {
 		Keyword_category keword = new Keyword_category(1,1,0,4,1,0,1,0,0,0,0);
 		key_score.sum_key_word(keword);
 	}
	if ( ghosts != null) {
 		Keyword_category keword = new Keyword_category(0,0,0,0,1,0,5,0,0,0,0);
 		key_score.sum_key_word(keword);
 	}
	if ( horseback != null) {
 		Keyword_category keword = new Keyword_category(3,3,0,0,0,3,0,0,0,3,0);
 		key_score.sum_key_word(keword);
 	}
	if ( kungfu != null) {
 		Keyword_category keword = new Keyword_category(5,0,0,0,0,0,0,0,0,0,0);
 		key_score.sum_key_word(keword);
 	}
	if ( legendary != null) {
 		Keyword_category keword = new Keyword_category(0,2,0,0,0,3,0,0,0,0,0);
 		key_score.sum_key_word(keword);
 	}
	if ( light_hearted != null) {
 		Keyword_category keword = new Keyword_category(0,0,2,0,2,0,0,3,0,0,2);
 		key_score.sum_key_word(keword);
 	}
	if ( musical != null) {
 		Keyword_category keword = new Keyword_category(0,0,0,0,0,0,0,5,0,0,3);
 		key_score.sum_key_word(keword);
 	}
	if ( poppins != null) {
 		Keyword_category keword = new Keyword_category(0,0,0,0,0,1,0,4,0,0,0);
 		key_score.sum_key_word(keword);
 	}
	if ( relish != null) {
 		Keyword_category keword = new Keyword_category(0,0,0,0,0,0,0,0,0,0,5);
 		key_score.sum_key_word(keword);
 	}
	if ( strength != null) {
 		Keyword_category keword = new Keyword_category(3,3,0,0,0,0,0,0,0,4,0);
 		key_score.sum_key_word(keword);
 	}
	if ( workout != null) {
 		Keyword_category keword = new Keyword_category(0,0,0,0,0,0,0,4,0,0,0);
 		key_score.sum_key_word(keword);
 	}
	if ( zombie != null) {
 		Keyword_category keword = new Keyword_category(0,0,0,0,0,0,0,5,0,0,0);
 		key_score.sum_key_word(keword);
 	}
	if ( flood != null) {
 		Keyword_category keword = new Keyword_category(4,3,0,2,2,3,2,0,4,2,0);
 		key_score.sum_key_word(keword);
 	}
	if ( historical != null) {
 		Keyword_category keword = new Keyword_category(0,0,0,0,0,5,0,0,0,1,0);
 		key_score.sum_key_word(keword);
 	}
	if ( mathematician != null) {
 		Keyword_category keword = new Keyword_category(0,0,0,0,0,0,0,0,5,0,0);
 		key_score.sum_key_word(keword);
 	}
	if ( monarchy != null) {
 		Keyword_category keword = new Keyword_category(0,0,0,0,0,4,0,0,2,0,0);
 		key_score.sum_key_word(keword);
 	}
	if ( monsters != null) {
 		Keyword_category keword = new Keyword_category(0,0,0,0,0,0,0,0,4,1,0);
 		key_score.sum_key_word(keword);
 	}
	if ( planets != null) {
 		Keyword_category keword = new Keyword_category(0,0,0,0,0,1,0,0,5,0,0);
 		key_score.sum_key_word(keword);
 	}
	if ( prince != null) {
 		Keyword_category keword = new Keyword_category(0,0,3,0,4,1,0,1,0,0,3);
 		key_score.sum_key_word(keword);
 	}
	if ( spy != null) {
 		Keyword_category keword = new Keyword_category(2,0,0,1,0,0,1,0,0,4,0);
 		key_score.sum_key_word(keword);
 	}
	if ( supernatural != null) {
 		Keyword_category keword = new Keyword_category(0,4,0,0,0,0,0,0,4,0,0);
 		key_score.sum_key_word(keword);
 	}
	if ( triumphs != null) {
 		Keyword_category keword = new Keyword_category(0,3,0,0,0,4,0,0,0,4,0);
 		key_score.sum_key_word(keword);
 	}
	if (vies != null) {
 		Keyword_category keword = new Keyword_category(0,0,0,0,0,4,0,0,0,3,0);
 		key_score.sum_key_word(keword);
 	}
	Vector<String> category_str = new Vector<String>();
	category_str = key_score.get_category();
	Data_processor dp = new Data_processor();
	dp.recommend_key_word(category_str);
	Vector<Recommend_movie> movie_results = new Vector<Recommend_movie>();
	movie_results = dp.movie_results;
 %>  

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
          		window.self.location = "index.jsp"
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
            	<p>You can use up to ten key words as you like.
            		the movie links according to your keywords selection is shown below</p>
          	  </div>
	          	  <div class="row-fluid">
					 <div id = "movie_item_list_recommend">
				      <% int i = 0;%>
				      <%while(i < movie_results.size()) {%>
				      	<div class="jumbotron">
				    		<a href="<%=movie_results.get(i).mvURL %>"> <%=movie_results.get(i).mvURL %></a>
				    	</div>
						<%i++;}%>
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