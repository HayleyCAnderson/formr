class Survey < ActiveRecord::Base
  belongs_to :user, validates: true
end
