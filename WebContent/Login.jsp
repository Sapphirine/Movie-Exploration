<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="big_movie_web.Data_processor" %>
<%@ page import ="big_movie_web.User_manager" %>
<%@ page import ="big_movie_web.State_constants" %>    
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<script>
	<%
	Data_processor dp = new Data_processor();
	
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	int log_state = State_constants.nothing_happen;
	if (!(username.equals("") || (password.equals("")))) {
		User_manager user = new User_manager();
		user.set_user_attr(username, password);
		log_state = dp.login(user);
	}
	
	if (log_state == State_constants.user_match) {
	  	Boolean logged_in = new Boolean(true);
	    session.setAttribute("username", username);
	}
	%>
	if (<%= log_state == State_constants.wrong_passward%>) {
	    alert("Wrong password! Please enter your password again!");
	    window.self.location = "index.jsp";
	} else if (<%= log_state == State_constants.user_match%>) {
	    alert("user loged in");
	    window.self.location = "account.jsp";
	} else if (<%= log_state = State_constants.user_not_exist%>) {
		alert("user_name note exist");
		window.self.location = "index.jsp"; 
	}
	
</script>

<html>
  <head>
   
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

      <div class="searchline">
        <div class="row">
          <form id = "search_form">
            <input class="span6" type="text" placeholder="search" name="search_blank">
            <div class"span1"></div>
            <button type="button" class="btn" onclick="list_movie()">search</button>
          </form>
        </div>
      </div>
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