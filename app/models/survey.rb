class Survey < ActiveRecord::Base
  belongs_to :user, validates: true

  validates :name, presence: true
end
