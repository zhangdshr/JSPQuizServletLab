<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.mum.cs472.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Quiz Servlet Lab</title>
</head>
<body>

	<%!String msg = "";
	String age = "";
	String answer = "";
	int times = 0;
	String scoreF = "";
	boolean showScoreF = false;%>

	<%
		String subTag = request.getParameter("submit");

		if (subTag != null && subTag.equalsIgnoreCase("ageSubmit")) {

			age = request.getParameter("age");
			System.out.println(age);
			if (MyTools.isNumeric(age)) {
				int a = Integer.parseInt(age);
				if (a > 4 && a < 99) {
					System.out.println("varify succ");
					msg = "varify succ";
				} else {
					System.out.println("varify range fail");
					msg = "varify range fail";
				}
			} else {
				System.out.println("This is not a number");
				msg = "This is not a number";
			}

		} else if (subTag != null && subTag.equalsIgnoreCase("answerSubmit")) {

			answer = request.getParameter("answer");
			System.out.println(answer);

			if (answer.equalsIgnoreCase(String.valueOf(QuestionAnswer.answers[QuestionAnswer.qIndex]))
					&& times == 0) {

				if (QuestionAnswer.qIndex < QuestionAnswer.questions.length - 1) {
					QuestionAnswer.qIndex++;
				} else if (QuestionAnswer.qIndex == QuestionAnswer.questions.length - 1) {
					showScoreF = true;
				}

				QuestionAnswer.score += 10;
				times = 0;

			} else if (answer.equalsIgnoreCase(String.valueOf(QuestionAnswer.answers[QuestionAnswer.qIndex]))
					&& times == 1) {

				if (QuestionAnswer.qIndex < QuestionAnswer.questions.length - 1) {
					QuestionAnswer.qIndex++;
				} else if (QuestionAnswer.qIndex == QuestionAnswer.questions.length - 1) {
					showScoreF = true;
				}

				QuestionAnswer.score += 5;
				times = 0;

			} else if (answer.equalsIgnoreCase(String.valueOf(QuestionAnswer.answers[QuestionAnswer.qIndex]))
					&& times == 2) {

				if (QuestionAnswer.qIndex < QuestionAnswer.questions.length - 1) {
					QuestionAnswer.qIndex++;
				} else if (QuestionAnswer.qIndex == QuestionAnswer.questions.length - 1) {
					showScoreF = true;
				}

				QuestionAnswer.score += 2;
				times = 0;

			} else if (!answer.equalsIgnoreCase(String.valueOf(QuestionAnswer.answers[QuestionAnswer.qIndex]))) {

				if (times > 2) {

					times = 0;

					if (QuestionAnswer.qIndex < QuestionAnswer.questions.length - 1) {
						QuestionAnswer.qIndex++;
					} else if (QuestionAnswer.qIndex == QuestionAnswer.questions.length - 1) {
						showScoreF = true;
					}

				} else {
					times++;
				}

			}

			if (QuestionAnswer.qIndex == QuestionAnswer.questions.length - 1 && showScoreF) {
				if (QuestionAnswer.score >= 45) {
					scoreF = "A";
				} else if (QuestionAnswer.score >= 35 && QuestionAnswer.score <= 44) {
					scoreF = "B";
				} else if (QuestionAnswer.score >= 25 && QuestionAnswer.score <= 34) {
					scoreF = "C";
				} else {
					scoreF = "D";
				}
			}

		}
	%>


	<form method="post">
		<input type="text" name="age" value=<%=age%>> <input
			type="submit" name='submit' value='ageSubmit'>
	</form>


	<p><%=msg%></p>

	<form method="post">

		<strong>The Number Quiz</strong><br> <input readonly="readonly"
			type="text" name="currentScore" value="Your current score is :">
		<%=QuestionAnswer.score%>
		<br> Guess the next number is the sequence <input
			readonly="readonly" type="text" name="questionNums"
			value=<%=QuestionAnswer.questions[QuestionAnswer.qIndex]%>><br>

		<p>
			Your answer : <input type="text" name="answer">
		</p>
		<input type="submit" name="submit" value="answerSubmit">

		<p style="color: red">
			Your final grade is
			<%=scoreF%>
		</p>

	</form>

</body>
</html>