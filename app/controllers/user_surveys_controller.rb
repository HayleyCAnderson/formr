class UserSurveysController < ApplicationController
  def create
    complete_survey = Results.new(params)
    complete_survey.update_results!

    redirect_to thanks_path
  end
end
