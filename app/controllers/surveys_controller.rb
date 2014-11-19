class SurveysController < ApplicationController
  before_action :require_login, except: [:show]

  def index
  end

  def new
    @survey = Survey.new
    @questions = Array.new(5) { @survey.questions.new }
    @questions.each do |question|
      question.answers = Array.new(4) { @survey.answers.new }
    end
  end

  def create
    survey = current_user.surveys.new(survey_params)
    survey.save

    redirect_to survey
  end

  def show
    survey
  end

  def edit
    survey
  end

  def update
    survey.update(survey_params)

    redirect_to survey
  end

  def destroy
    survey.destroy

    redirect_to surveys_path
  end

  private

  def survey
    @survey ||= Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(
      :name,
      questions_attributes: [
        :content, answers_attributes: [:choice]
      ]
    )
  end
end
