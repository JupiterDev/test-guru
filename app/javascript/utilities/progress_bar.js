document.addEventListener("turbolinks:load", function() {
	var progressBar = document.createElement('progress');
	var currentQuestionP = document.querySelector('#current-question') 

	var testPassageForm = document.querySelector('.test-passage-form');
	
	if (testPassageForm) {
		var currentQuestion = testPassageForm.dataset.currentQuestionNumber;
		var numberOfQuestions = testPassageForm.dataset.numberOfQuestions;
	}

	progressBar.setAttribute("value", currentQuestion);
	progressBar.setAttribute("max", numberOfQuestions);

	if (currentQuestionP) {
		currentQuestionP.appendChild(progressBar);
	}
	
});
