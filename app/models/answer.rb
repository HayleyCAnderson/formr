class Answer < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question

  def increase_count
    self.results_count += 1
  end
end
