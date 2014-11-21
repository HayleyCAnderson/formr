class UserSurveysController < ApplicationController
  def create
    complete_survey = Results.new(params)
    complete_survey.update_results!

    redirect_to root_path
  end
end
