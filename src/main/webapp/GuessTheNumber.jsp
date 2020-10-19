<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Guess the Number Game</title>
<link rel="stylesheet" href="https://unpkg.com/mvp.css">
</head>
<body>
<div align="center" style="margin-top: 10px;">
<span style="color: #00264d; font-size: 150%;">Guess the Number Game</span><br/>
<img src="./images/phone-numbers.jpg" width="250" height="167" /><br/>
${feedback}
<%
  Integer randomNumber = (Integer) request.getAttribute("random_number");
  Integer guessCount = (Integer) request.getAttribute("guess_count");
  if (guessCount == null) {
      guessCount = 0;
  }
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
    <input type="hidden" name="guess_count" value="<%= guessCount + 1 %>" />
    <input type="submit" value="submit" />
</form>
<%
  }
%>
</div>

</body>
</html>
