Movie-Exploration
=================
The source codes are mainly in the directories WebContect and src. The following is the directory structure and brief funciton introduction to each code file.

WebContent/
	account.jsp
	category.jsp
	handle_key_word.jsp
	handle_signup.jsp
	index.jsp
	keyword.jsp
	Login.jsp
	prediction.jsp
	Recommender.jsp
	Signup.jsp

account.jsp
	The page shown when a user is logged in.

category.jsp
	Page for calculating average ratings for different 	movie categories.
	Get the choice from user when user select a choice.

handle_key_word.jsp
	Page response to the user request to recommend 	movies according to their
	key words selection. It mainly calls backend class “Keyword_score.java”
	to calculate the results.

handle_signup.jsp
	Response to the sign up request. Call backend 	class ”Data_processor” to verify
	the sign up and update data base for user 	information.

Index.jsp
	Main page for user;

Keyword.jsp
	Get users’ selections for keywords and request to 	“handle_key_word.jsp”

Login.jsp
	Got user login request and call ”Data_processor” to 	search the data base to verify the users’ login

Prediction.jsp
	Get users’ selection for keywords. And handle 	requests itself by
	calling “Keyword_score.java” methods to come 	out the results.

Recommender.jsp
	Handle the response for recommendation
	Call “Recommend_correlation.java” methods to do 	userBase and Itembased
	recommendation.

Signup.jsp
	Collect all the user signup information and send 	request to “handle_sign_up.jps”
	to handle the sign up.
JAVA:
src/
	big_movie_web/
		Data_processor.java
		State_constants.java
		User_manager.java
		Keyword
		Keyword_category.java
		Keyword_constants.java
		Keyword_score.java
		Recommender
		Recommend_correlation.java
		Recommend_list.java
		Recommend_movie.java
		Recommend_user.java
	keyword/
		Keyword_category.java
		Keyword_constants.java
		Keywords_score.java
	Recommender/
		Recommend_correlation.java
		Recommend_list.java
		Recommend_movie.java
		Recommend_user.java

Data_processor.java
	Handling all the operations to databases. It is 	mostly accessed by “*jsp” to provide
	data requested.

State_constants.java
	Containing all the commonly constants including 	error return number.

User_manager.java
	A class to manage user information (name, 	password)

Keyword_category.java
	A class to manage the keywords. Managing the 	weight of a keyword toward
	specific movie categories. 

Keyword_constants.java
	Containing average rates for specific categories

Keyword_score.java
	Handling calculations for key points 	recommendation and key word prediction.
	Called by handle_”key_word.jsp” and 	“prediction.jsp”

Recommend_correlation.java
	Class to manage the correlation between users.
	Calculate correlations.
	Called by “recommendation.jsp”

Recommend_list.java
	Calculate the recommendation results.
	Called by “recommendation.jsp”

Recommend_movie.java
	Manages the move_meta data

Recommend_user.java
	Manages the user_meta data

A website was done to implement the project. The website link is 
http://helloweb-iadtfdepia.elasticbeanstalk.com/
The website is constructed as follows.

1.Front side: jsp (a language mix of java and html) including all the pages that can be viewed by customers
2.Back end: java used for accessing databases and calculating results for user request. For example, if user request for recommendation, the back end java classes will get user request and access data-base for necessary data. Furthermore, it would also come out the results based on the data accessed from database
3.Using Eclipse to test the entire front and back end codes
4.Server: Aws free server. Allow user to set up website on it
5.Tools using Aws tool kit allow remote debugging on the website. And the Aws tool kit was embedded it into eclipse; locally debug was done before push it online. 
Server version: Tomcat v7.0 server
6. URL:
http://helloweb-iadtfdepia.elasticbeanstalk.com/
7. Database:
Mysql accessed via AWS RDS. 20G storage.
To debug on remote mysql: using tools MYSQL Workbench to test database connection.
To connect java to remote mysql: using java library "jdbc"(providing all the apis to access mysql) .
