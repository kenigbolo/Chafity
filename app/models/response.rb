class Response < ApplicationRecord
  belongs_to :message
  has_one :schedule
end
