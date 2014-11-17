class SurveysController < ApplicationController
  before_action :require_login, execpt: [:show]
  def index
  end

  def new
    @survey = Survey.new
  end

  def show
  end
end
