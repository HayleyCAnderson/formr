class SurveysController < ApplicationController
  before_action :require_login, except: [:show]
  def index
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = current_user.surveys.new(survey_params)
    @survey.save

    redirect_to survey_path(@survey)
  end

  def show
    @survey = Survey.find(params[:id])
  end

  private

  def survey_params
    params.require(:survey).permit(:name)
  end
end
