<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@ page import="big_movie_web.Data_processor" %>
<%@ page import ="big_movie_web.User_manager" %>
<%@ page import ="big_movie_web.State_constants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
	Data_processor dp = new Data_processor();
	String movie_type = request.getParameter("category");
	String header = new String();
	String paragraph = new String();
	Float avg_rate = dp.category_avg_rate(movie_type);
	header = movie_type + " movies' rating";
	if (movie_type.equals("action")) {
		paragraph = "This major genre type includes films that have tremendous impact, continuous high energy, lots of physical stunts and activity, possibly extended chase scenes, races, rescues, battles, martial arts, mountains and mountaineering, destructive disasters (floods, explosions, natural disasters, fires, etc.), fights, escapes, non-stop motion, spectacular rhythm and pacing, and adventurous heroes - all designed for pure audience escapism with the action sequences at the core of the film.(reference：http://www.filmsite.org/actionfilms.html)";
	} else if (movie_type.equals("adventure")) {
		paragraph = "Adventure Films are exciting stories, with new experiences or exotic locales. Adventure films are very similar to the action film genre, in that they are designed to provide an action-filled, energetic experience for the film viewer. Rather than the predominant emphasis on violence and fighting that is found in action films, however, the viewer of adventure films can live vicariously through the travels, conquests, explorations, creation of empires, struggles and situations that confront the main characters, actual historical figures or protagonists.(reference:http://www.filmsite.org/adventurefilms.html) ";
	} else if (movie_type.equals("science/fiction")) {	
		paragraph = "Science Fiction Films are usually scientific, visionary, comic-strip-like, and imaginative, and usually visualized through fanciful, imaginative settings, expert film production design, advanced technology gadgets (i.e., robots and spaceships), scientific developments, or by fantastic special effects. Sci-fi films are complete with heroes, distant planets, impossible quests, improbable settings, fantastic places, great dark and shadowy villains, futuristic technology and gizmos, and unknown and inexplicable forces. Many other SF films feature time travels or fantastic journeys, and are set either on Earth, into outer space, or (most often) into the future time. Quite a few examples of science-fiction cinema owe their origins to writers Jules Verne and H.G. Wells.(reference:http://www.filmsite.org/sci-fifilms.html";
	} else if (movie_type.equals("crime")) {
		paragraph = "Crime and Gangster Films are developed around the sinister actions of criminals or gangsters, particularly bankrobbers, underworld figures, or ruthless hoodlums who operate outside the law, stealing and violently murdering their way through life. In the 1940s, a new type of crime thriller emerged, more dark and cynical - see the section on film-noir for further examples of crime films. Criminal and gangster films are often categorized as post-war film noir or detective-mystery films - because of underlying similarities between these cinematic forms.(reference：http://www.filmsite.org/crimefilms.html) ";
	} else if (movie_type.equals("drama")) {
		paragraph = "Drama Films are serious presentations or stories with settings or life situations that portray realistic characters in conflict with either themselves, others, or forces of nature. A dramatic film shows us human beings at their best, their worst, and everything in-between. Each of the types of subject-matter themes have various kinds of dramatic plots. Dramatic films are probably the largest film genre because they include a broad spectrum of films. See also crime films, melodramas, epics (historical dramas), biopics (biographical), or romantic genres - just some of the other genres that have developed from the dramatic genre.(reference:http://www.filmsite.org/dramafilms.html)";
	} else if (movie_type.equals("historical")) {
		paragraph = "Epics-Historical Films often take an historical or imagined event, mythic, legendary, or heroic figure, and add an extravagant setting and lavish costumes, accompanied by grandeur and spectacle and a sweeping musical score. Epics, costume dramas, historical dramas, war film epics, medieval romps, or 'period pictures' are tales that often cover a large expanse of time set against a vast, panoramic backdrop. In an episodic manner, they follow the continuing adventures of the hero(s), who are presented in the context of great historical events of the past. (reference:http://www.filmsite.org/epicsfilms.html)";
	} else if (movie_type.equals("horror")) {
		paragraph = "Horror Films are unsettling films designed to frighten and panic, cause dread and alarm, and to invoke our hidden worst fears, often in a terrifying, shocking finale, while captivating and entertaining us at the same time in a cathartic experience. Horror films effectively center on the dark side of life, the forbidden, and strange and alarming events. They deal with our most primal nature and its fears: our nightmares, our vulnerability, our alienation, our revulsions, our terror of the unknown, our fear of death and dismemberment, loss of identity, or fear of sexuality.(reference:http://www.filmsite.org/horrorfilms.html)";
	} else if (movie_type.equals("war")) {
		paragraph = "War and Anti-War Films often acknowledge the horror and heartbreak of war, letting the actual combat fighting or conflict (against nations or humankind) provide the primary plot or background for the action of the film. Typical elements in the action-oriented war plots include POW camp experiences and escapes, submarine warfare, espionage, personal heroism, war is hell brutalities, air dogfights, tough trench/infantry experiences, or male-bonding buddy adventures during wartime. Themes explored in war films include combat, survivor and escape stories, tales of gallant sacrifice and struggle, studies of the futility and inhumanity of battle, the effects of war on society, and intelligent and profound explorations of the moral and human issues.(reference: http://www.filmsite.org/warfilms.html)";
	} else if (movie_type.equals("romantic")) {
		paragraph = "Romance Films: Romance films are love stories, or affairs of the heart that center on passion, emotion, and the romantic, affectionate involvement of the main characters (usually a leading man and lady), and the journey that their love takes through courtship or marriage. Romance films make the love story or the search for love the main plot focus. Oftentimes, lovers in screen romances (often romantic dramas) face obstacles and the hazards of hardship, finances, physical illness, racial or social class status, occupation, psychological restraints, or family that threaten to break their union and attainment of love. As in all romantic relationships, tensions of day-to-day life, temptations (of infidelity), and differences in compatibility enter into the plots of romantic films.(reference: http://www.filmsite.org/romancefilms.html)";
	} else if (movie_type.equals("comedy")) {
		paragraph = "Comedy Films are make 'em laugh films designed to elicit laughter from the audience. Comedies are light-hearted dramas, crafted to amuse, entertain, and provoke enjoyment. The comedy genre humorously exaggerates the situation, the language, action, and characters. Comedies observe the deficiencies, foibles, and frustrations of life, providing merriment and a momentary escape from day-to-day life. They usually have happy endings, although the humor may have a serious or pessimistic side.(reference: http://www.filmsite.org/comedyfilms.html) ";
	} else if (movie_type.equals("musical/dance")) {
		paragraph = "Musicals / Dance Films are cinematic forms that emphasize and showcase full-scale song and dance routines in a significant way (usually with a musical or dance performance as part of the film narrative, or as an unrealistic eruption within the film). Or they are films that are centered on combinations of music, dance, song or choreography. In traditional musicals, cast members are ones who sing. Musicals highlight various musical artists or dancing stars, with lyrics that support the story line, often with an alternative, escapist vision of reality - a search for love, success, wealth, and popularity. This genre has been considered the most escapist of all major film genres. Tremendous film choreography and orchestration often enhances musical numbers.(reference: http://www.filmsite.org/musicalfilms.html)";
	} else {
		paragraph = "Crime and Gangster Films are developed around the sinister actions of criminals or gangsters, particularly bankrobbers, underworld figures, or ruthless hoodlums who operate outside the law, stealing and violently murdering their way through life. In the 1940s, a new type of crime thriller emerged, more dark and cynical - see the section on film-noir for further examples of crime films. Criminal and gangster films are often categorized as post-war film noir or detective-mystery films - because of underlying similarities between these cinematic forms.(reference:http://www.filmsite.org/crimefilms.html) ";
	}
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
	              <li class="nav-header">exiting</li>
	              <li><a href="category.jsp?category=action">action</a></li>
	              <li><a href="category.jsp?category=adventure">adventure</a></li>
	              <li><a href="category.jsp?category=science/fiction">science/fiction</a></li>
	              <li class="nav-header">hot</li>
	              <li><a href="category.jsp?category=crime">crime</a></li>
	              <li><a href="category.jsp?category=drama">drama</a></li>
	              <li><a href="category.jsp?category=historical">historical</a></li>
	              <li><a href="category.jsp?category=horror">horror</a></li>
	              <li class="nav-header">classic</li>
	              <li><a href="category.jsp?category=war">war</a></li>
	              <li><a href="category.jsp?category=romantic">romantic</a></li>              
	              <li><a href="category.jsp?category=comedy">comedy</a></li>
	              <li><a href="category.jsp?category=musical/dance">musical/dance</a></li>
	            </ul>
	          </div><!--/.well -->
	        </div><!--/span-->
	        <div class="span9">
	          <div class="hero-unit">
	            <h2><%= header%></h2>
	            <p><%= paragraph%></p>
	          </div>

	          <div class="row-fluid">
	            <div class="span8">
	            <h2><%= "average rate for " + movie_type + " is: " + avg_rate%> &raquo;</h2>
	            </div><!--/span-->

          </div><!--/row-->
        </div><!--/span-->
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