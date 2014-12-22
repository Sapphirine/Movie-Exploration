<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="big_movie_web.Data_processor" %>
<%@ page import ="big_movie_web.User_manager" %>
<%@ page import ="big_movie_web.State_constants" %>      
    
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
          </div><!--/.nav-collapse -->
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

      <div class="container">
          <form id = "search_form" action="handle_signup.jsp">
          	<h4 class="span2 ">user_name: </h4>
            <input class="span4" type="text" placeholder="password" name="username">
            <br>
            <h4 class="span2 ">password: </h4>
            <input class="span5" type="text" placeholder="password" name="password">
            
            <div class="row-fluid marketing">
		        <div class="span6">
		          <h4>Chushingura</h4>
		          <p>This film is one of the two best Samurai films of all time, the other being Kurosawa's SEVEN SAMURAI. CHUSHINGURA ("loyalty") is based on a real incident in 18th century Japan, wherein 47 loyal retainers of a disgraced lord take a vow of vengeance on the corrupt nobleman who caused his downfall and death.</p>
			          <select name="mov1">
			          	  <option value="0">not rated</option>
						  <option value="1">1</option>
						  <option value="2">2</option>
						  <option value="3">3</option>
						  <option value="4">4</option>
						  <option value="5">5</option>
					  </select>
		          <h4>Westward Ho</h4>
		          <p>The older surviving brother of a wagon train ambush, seeks revenge on the leader of the gang responsible for the murder of his parents and the kidnapping of his younger brother. Years later, he is the leader of a group of 'vigilantes' who oppose lawlessness and unknowingly confronts his 'long-loss-brother' who has since learned the tricks-of-the-trade from the outlaws.</p>
			          <select name="mov2">
			          	  <option value="0">not rated</option>
						  <option value="1">1</option>
						  <option value="2">2</option>
						  <option value="3">3</option>
						  <option value="4">4</option>
						  <option value="5">5</option>
					  </select>
		          <h4>Cartoon Network Christmas 3</h4>
		          <p>I Am Weasel: "The Legend of Big Butt" - Paranormalists Weasel and Baboon take a trip to the Himalayas in search of the elusive creature Big Butt.</p>
			          <select name="mov3">
			          	  <option value="0">not rated</option>
						  <option value="1">1</option>
						  <option value="2">2</option>
						  <option value="3">3</option>
						  <option value="4">4</option>
						  <option value="5">5</option>
					  </select>
		        </div>
		
		        <div class="span6">
		          <h4>The Girl Next Door</h4>
		          <p>There is a point in "The Girl Next Door - Unrated Edition' (which I received and promptly devoured, extra's and all, in one sitting) where the movie is in danger of changing in tone and focus from American Pie to Showgirls, but luckily for the movie - and viewers - it recovers itself and ends in a definite teen comedy spirit.</p>
			          <select name="mov4">
			          	  <option value="0">not rated</option>
						  <option value="1">1</option>
						  <option value="2">2</option>
						  <option value="3">3</option>
						  <option value="4">4</option>
						  <option value="5">5</option>
					  </select>
		
		          <h4>Baby Einstein: World Music</h4>
		          <p>Baby Einstein's newest DVD offers a whole new musical beat that exposes babies to music from around the world. The fun-damentals and beauty of music are explored through real world images and sounds collected around the globe and reorchestrated for baby's eyes and ears. Activities and simple children's songs encourage parents and babies to drum, shake, blow, strum and sing alon with the musical fun.</p>
			          <select name="mov5">
			          	  <option value="0">not rated</option>
						  <option value="1">1</option>
						  <option value="2">2</option>
						  <option value="3">3</option>
						  <option value="4">4</option>
						  <option value="5">5</option>
					  </select>
		
		          <h4>National Lampoon's Lost Reality 1 and 2</h4>
		          <p>The first Lost Reality is funny, but the second is better. Lost Reality is a collection of mock reality show pilots that apparently didn't get chosen to become ongoing reality TV series. They are offensively hilarious, but Lost Reality is probably an acquired taste in it's vulgar humor. Both films are worth buying if you're into a little bit of funny shock value, especially Lost Reality 2.</p>
			          <select name="mov6">
			          	  <option value="0">not rated</option>
						  <option value="1">1</option>
						  <option value="2">2</option>
						  <option value="3">3</option>
						  <option value="4">4</option>
						  <option value="5">5</option>
					  </select>
		        </div>
		        <hr>
		        <button class="searchline" type="submit">submit</button>
      		</div>
            
            <div class="span6" >
            	
            </div>
            
          </form>
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