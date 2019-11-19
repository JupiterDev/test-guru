document.addEventListener("turbolinks:load", function() {
	var progressBar = document.createElement('progress');
	var currentQuestionP = document.querySelector('#current-question') 

	var testPassageForm = document.querySelector('.test-passage-form');
	var currentQuestion = testPassageForm.getAttribute("data-current-question-number");
	var numberOfQuestions = testPassageForm.getAttribute("data-number-of-questions");

	progressBar.setAttribute("value", currentQuestion);
	progressBar.setAttribute("max", numberOfQuestions);

	currentQuestionP.appendChild(progressBar);
});
