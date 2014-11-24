class Question < ActiveRecord::Base
  belongs_to :survey
  default_scope { order(:id) }

  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for(
    :answers,
    allow_destroy: true,
    reject_if: :all_blank
  )
end
