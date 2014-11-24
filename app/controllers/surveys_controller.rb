class SurveysController < ApplicationController
  before_action :require_login, except: [:show]

  def index
  end

  def new
    survey_build
  end

  def create
    survey = current_user.surveys.new(survey_params)

    if survey.save
      redirect_to survey_confirmations_path(survey)
    else
      survey_build
      render :new
    end
  end

  def show
    survey
  end

  def edit
    survey
  end

  def update
    if survey.update(survey_params)
      redirect_to survey_confirmations_path(survey)
    else
      render :edit
    end
  end

  def destroy
    survey.destroy

    redirect_to surveys_path
  end

  private

  def survey
    @survey ||= Survey.find(params[:id])
  end

  def survey_build
    @survey = Survey.new
    @questions = Array.new(5) { @survey.questions.new }
    @questions.each do |question|
      question.answers = Array.new(4) { @survey.answers.new }
    end
  end

  def survey_params
    params.require(:survey).permit(
      :name,
      questions_attributes: [
        :id, :content, :_destroy,
        answers_attributes: [:id, :choice, :_destroy]
      ]
    )
  end
end
