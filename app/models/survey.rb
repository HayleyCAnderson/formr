class Survey < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user
  default_scope { order(id: :desc) }

  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions

  accepts_nested_attributes_for(
    :questions,
    allow_destroy: true,
    reject_if: lambda { |attributes| attributes["content"].blank? }
  )
  accepts_nested_attributes_for(
    :answers,
    allow_destroy: true,
    reject_if: :all_blank
  )
end
