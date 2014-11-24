class ThanksController < ApplicationController
  def show
    @survey = Survey.find(survey_id)
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end

  private

  def survey_id
    survey_url = request.referer
    survey_url.split("/").pop
  end
end
