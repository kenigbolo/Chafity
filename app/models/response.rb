class Response < ApplicationRecord
  belongs_to :message
  has_one :schedule

  def appointment_date!
    DateTime.parse(self.body).strftime('%Y %B %A %H %M')
  end
end
