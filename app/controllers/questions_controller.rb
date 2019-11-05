class QuestionsController < ApplicationController
  before_action :find_test, only: :create

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: find_test.questions.pluck(:body)
  end

  def show
    render plain: find_question.body
  end

  def new
  end
  
  def create
    @question = find_test.questions.create(question_params)
    redirect_to test_questions_path
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    head 404
  end
end
