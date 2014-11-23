class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :answered_fraction

  def answered_fraction(question, current_answer)
    answers_count = 0
    question.answers.each do |answer|
      answers_count += answer.results_count
    end
    current_answer.results_count.to_f / answers_count
  end
end
