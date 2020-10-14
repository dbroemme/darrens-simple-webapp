package com.thebroemmergroup.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NumberGuessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String NUMBER_KEY = "random_number";
    private static final String GUESS_KEY = "user_guess";
    private static final String FEEDBACK_KEY = "feedback";
    private static final String DONE_KEY = "done_flag";

	protected void doGet(final HttpServletRequest request, final HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(final HttpServletRequest request, final HttpServletResponse response)
            throws ServletException, IOException {

        final String strRandomNumber = (String) request.getParameter(NUMBER_KEY);
        final String strUserGuess = (String) request.getParameter(GUESS_KEY);
        Integer userGuess = null;
        Integer randomNumber = null;
        String feedback = "A random number was chosen between 1-10.<br/>"
                        + "You have three chances to guess what it is.";
        Boolean done = false;

        if (strRandomNumber == null) {
            randomNumber = (new Random().nextInt(10)) + 1;
            System.out.println("A new random number was chosen: " + randomNumber);
        } else {
            randomNumber = Integer.valueOf(strRandomNumber);
            try {
                userGuess = Integer.valueOf(strUserGuess);
                System.out.println("The user guessed: " + userGuess);
                if (userGuess < randomNumber) {
                    feedback = "Your guess of " + userGuess + " is too low.<br/>Try a higher number";
                } else if (userGuess > randomNumber) {
                    feedback = "Your guess of " + userGuess + " is too high.<br/>Try a lower number";
                } else {
                    feedback = "You guessed it! The number was " + userGuess + ".";
                    done = true;
                }
            } catch (NumberFormatException nfe) {
                feedback = "Please enter a valid number.";
            }
        }

        final RequestDispatcher requestDispatcher
            = request.getRequestDispatcher("GuessTheNumber.jsp");
        request.setAttribute(NUMBER_KEY, randomNumber);
        request.setAttribute(GUESS_KEY, userGuess);
        request.setAttribute(FEEDBACK_KEY, feedback);
        request.setAttribute(DONE_KEY, done);
        requestDispatcher.forward(request, response);
    }
}