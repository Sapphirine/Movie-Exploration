<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.util.Vector"%>
<%@ page import="big_movie_web.Data_processor" %>
<%@ page import ="big_movie_web.User_manager" %>
<%@ page import ="big_movie_web.State_constants" %>
<%@ page import ="Recommender.Recommend_movie" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	<%
		String username = (String) session.getAttribute("username");
	%>
	if (username == null ) {
		alert("login first please..");
		window.self.location = "index.jsp";
	}
	
	if (username.equals("") ) {
		alert("login first please..");
		window.self.location = "index.jsp";
	}
	<%	
		Vector<Recommend_movie> movie_results = new Vector<Recommend_movie>();
		Data_processor dp = new Data_processor();
    	User_manager recommend_user = new User_manager();
    	recommend_user.set_user_attr(username, null);
    	int state = -1;
    	String command = request.getParameter("command");
    	if (command.equals("item_recommendation"))
    		state = dp.item_recommend(recommend_user);
    	else if (command.equals("user_recommendation"))
    		state = dp.user_recommend(recommend_user);
    	
    	movie_results = dp.movie_results;	
	%>
	alert("in recommend");

</script>

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
          <a class="brand" href="index.jsp">Big Movie</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="#">Key Word</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Recommender<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="divider"></li>
                  <li class="nav-header">Recommender</li>
                  <li><a href="Recommender.jsp?command=item_recommendation">Item Based</a></li>
                  <li><a href="Recommender.jsp?command=user_recommendation">User Based</a></li>
                </ul>
              </li>
        <li><a href="#about">About</a></li>
        <li><a href="#contact">Contact</a></li>
            </ul>
            <form class="navbar-form pull-right" action="Login.jsp" id="user_pass">
				<p id = "user_name_bar" class="navbar-text pull-right">
              		Logged in as <%= username%>
            	</p> 
            </form>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    

        <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Super Movie Recommendation</h1>
        <p class="lead">Awsome move recommendation, classification and key words search for
          both movie lovers and movie producers!
        </p>
      </div>

      <form action="" method="get" name="frm"> 
      <div id = "movie_item_list_recommend">
      <% int i = 0;%>
      <%while(command.equals("user_recommendation")
    		  && state == 0 && i < movie_results.size()) {%>
      	<div class="jumbotron">
      		<h3><%= i %>. movie: <%= movie_results.get(i).mvSerial%>   rate: <%= movie_results.get(i).movRate%></h3>
    		<a href="<%=movie_results.get(i).mvURL %>"> <%=movie_results.get(i).mvURL %></a>
    	</div>
		<%i++;}%>
		<%while(command.equals("item_recommendation")
    		  && state == 0 && i < movie_results.size()) {%>
      	<div class="jumbotron">
      		<h3><%= i+1 %>. movie: <%= movie_results.get(i).mvSerial%>  Average rate: <%= movie_results.get(i).avgRate%></h3>
    		<a href="<%=movie_results.get(i).mvURL %>"> <%=movie_results.get(i).mvURL %></a>
    	</div>
		<%i++;}%>
      <script>
      if (username == null) {
  		alert("login first please..");
  		window.self.location = "index.jsp";
  	  }
      
	</script>
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