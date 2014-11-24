class LandingController < ApplicationController
  def show
    @surveys = Survey.where(recommended: true).order(created_at: :desc)
  end
end
