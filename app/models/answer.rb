class Answer < ActiveRecord::Base
  belongs_to :question

  validates :choice, presence: true
end
