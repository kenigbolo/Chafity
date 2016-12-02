class Suggestion < ApplicationRecord
  belongs_to :user
  validates :charity_name, presence: true
end
