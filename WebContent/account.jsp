<%@page import="org.aspectj.weaver.reflect.Java14GenericSignatureInformationProvider"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.amazonaws.*" %>
<%@ page import="com.amazonaws.auth.*" %>
<%@ page import="com.amazonaws.services.ec2.*" %>
<%@ page import="com.amazonaws.services.ec2.model.*" %>
<%@ page import="com.amazonaws.services.s3.*" %>
<%@ page import="com.amazonaws.services.s3.model.*" %>
<%@ page import="com.amazonaws.services.dynamodbv2.*" %>
<%@ page import="com.amazonaws.services.dynamodbv2.model.*" %>
<%@ page import="big_movie_web.Data_processor" %>
<%@ page import ="big_movie_web.User_manager" %>
<%@ page import ="big_movie_web.State_constants" %>


<%! // Share the client objects across threads to
    // avoid creating new clients for each web request
    private AmazonEC2         ec2;
    private AmazonS3           s3;
    private AmazonDynamoDB dynamo;
 %>

<%
    /*
     * AWS Elastic Beanstalk checks your application's health by periodically
     * sending an HTTP HEAD request to a resource in your application. By
     * default, this is the root or default resource in your application,
     * but can be configured for each environment.
     *
     * Here, we report success as long as the app server is up, but skip
     * generating the whole page since this is a HEAD request only. You
     * can employ more sophisticated health checks in your application.
     */
    if (request.getMethod().equals("HEAD")) return;
%>

<%
    if (ec2 == null) {
        AWSCredentialsProvider credentialsProvider = new ClasspathPropertiesFileCredentialsProvider();
        ec2    = new AmazonEC2Client(credentialsProvider);
        s3     = new AmazonS3Client(credentialsProvider);
        dynamo = new AmazonDynamoDBClient(credentialsProvider);
    }
%>

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
          <a class="brand" href="#">Big Movie</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="keyword.jsp">Key Word</a></li>
              <li class="active"><a href="prediction.jsp">Predict</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Recommender<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="divider"></li>
                  <li class="nav-header">Recommender</li>
                  <li><a href="Recommender.jsp?command=item_recommendation">Item Based</a></li>
                  <li><a href="Recommender.jsp?command=user_recommendation">User Based</a></li>
                </ul>
              </li>
           <li></li>
          <li><a href="#contact">Contact</a></li>
            </ul>
			    <a class="navbar-form pull-right" href="#"><%= session.getAttribute("username")%></a>
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
	      
	      </div><!--/row-->

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