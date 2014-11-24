class ThanksController < ApplicationController
  def show
    begin
      @survey = Survey.find(survey_id)
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end

  private

  def survey_id
    survey_url = request.referer
    survey_url.split("/").pop
  end
end
