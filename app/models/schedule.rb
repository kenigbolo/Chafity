class Schedule < ApplicationRecord
  belongs_to :response
  validates :schedule, :response_id, presence: true
end
