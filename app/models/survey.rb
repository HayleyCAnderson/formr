class Survey < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user

  has_many :questions
  accepts_nested_attributes_for :questions
end
