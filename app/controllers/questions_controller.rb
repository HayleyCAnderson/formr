class QuestionsController < ApplicationController
  before_action :require_login, only: [:create]

  def create
    question = Question.new(question_params)
    question.save
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end
end
