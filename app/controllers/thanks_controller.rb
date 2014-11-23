class ThanksController < ApplicationController
  def show
    @referer_survey_id = request.referer.split("/").pop
    @survey = Survey.find(@referer_survey_id)
  end
end
