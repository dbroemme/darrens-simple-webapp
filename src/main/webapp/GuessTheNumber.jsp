<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Guess the Number Game</title>
<link rel="stylesheet" href="https://unpkg.com/mvp.css">
</head>
<body>
<h2>Guess the Number Game</h2>
<br/>
<div align="center" style="margin-top: 50px;">
<%= request.getAttribute("feedback") %>
<br/><br/>
<%
  Integer randomNumber = (Integer) request.getAttribute("random_number");
  Boolean isDone = (Boolean) request.getAttribute("done_flag");
  if (isDone) {
%>
<a href="NumberGuessServlet">Start a new game.</a>
<%
  } else {
%>
<form action="NumberGuessServlet" method="post">
    <label for="user_guess">Make your guess:</label>
    <input type="text" id="user_guess" name="user_guess" /><br>
    <input type="hidden" name="random_number" value="<%= randomNumber %>" />
    <input type="submit" value="submit" />
</form>
<%
  }
%>
</div>

</body>
</html>
