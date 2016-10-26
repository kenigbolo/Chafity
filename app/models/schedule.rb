class Schedule < ApplicationRecord
  belongs_to :response
  validates :schedule, presence: true
end
