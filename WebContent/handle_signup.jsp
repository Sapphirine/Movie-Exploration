<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="big_movie_web.Data_processor" %>
<%@ page import ="big_movie_web.User_manager" %>
<%@ page import ="big_movie_web.State_constants" %>
<%@ page import ="Recommender.Recommend_movie" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rate1 = request.getParameter("mov1");
		String rate2 = request.getParameter("mov2");
		String rate3 = request.getParameter("mov3");
		String rate4 = request.getParameter("mov4");
		String rate5 = request.getParameter("mov5");
		String rate6 = request.getParameter("mov6");
		boolean rate_valid = !(rate1.equals("0")
				&& rate2.equals("0")
				&& rate3.equals("0")
				&& rate4.equals("0")
				&& rate5.equals("0")
				&& rate6.equals("0"));
	%>
	if (<%= (username.equals("") || password.equals(""))%>) {
		alert("please enter both username and password");
		window.history.back(-1); 
	}
	
	if (<%= !rate_valid%>) {
		alert("rate at least one movie");
		window.self.location = "Signup.jsp";
	}
	
	<%
		int state = -1;
		Data_processor dp = new Data_processor();
		User_manager user = new User_manager();
		
		if (!(username.equals("")||password.equals("")||!rate_valid)) {			
			user.set_user_attr(username, password);
			state = dp.sign_up(user);
		}
		
		if (!rate1.equals("0") && state == State_constants.signed_up) {
			Recommend_movie movie = new Recommend_movie();
			movie.movId = 69;
			movie.movRate = Integer.parseInt(rate1);
			dp.insert_movie_record(user, movie);
		}
		
		if (!rate2.equals("0") && state == State_constants.signed_up) {
			Recommend_movie movie = new Recommend_movie();
			movie.movId = 54;
			movie.movRate = Integer.parseInt(rate2);
			dp.insert_movie_record(user, movie);
		}
		
		if (!rate3.equals("0") && state == State_constants.signed_up) {
			Recommend_movie movie = new Recommend_movie();
			movie.movId = 87;
			movie.movRate = Integer.parseInt(rate3);
			dp.insert_movie_record(user, movie);
		}
		
		if (!rate4.equals("0") && state == State_constants.signed_up) {
			Recommend_movie movie = new Recommend_movie();
			movie.movId = 389;
			movie.movRate = Integer.parseInt(rate4);
			dp.insert_movie_record(user, movie);
		}
		
		if (!rate5.equals("0") && state == State_constants.signed_up) {
			Recommend_movie movie = new Recommend_movie();
			movie.movId = 462;
			movie.movRate = Integer.parseInt(rate5);
			dp.insert_movie_record(user, movie);
		}
		
		if (!rate6.equals("0") && state == State_constants.signed_up) {
			Recommend_movie movie = new Recommend_movie();
			movie.movId = 741;
			movie.movRate = Integer.parseInt(rate6);
			dp.insert_movie_record(user, movie);
		}
		
		if (state == State_constants.signed_up)
			session.setAttribute("username", username);
	%>
	if (<%= state == State_constants.user_exist%>) {
		alert("user name already exists, pleas try another one");
		window.history.back(-1);
	} else if(<%= state == State_constants.signed_up%>) {
		alert("Sign up successfully");        
        window.self.location = "account.jsp";
	} else {
		alert("error occurred during signing up");
		window.history.back(-1);
	}	
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>