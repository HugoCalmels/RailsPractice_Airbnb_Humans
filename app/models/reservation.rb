class Reservation < ApplicationRecord
  belongs_to :user,
    dependent: :destroy
  belongs_to :guest, class_name: 'User',
    dependent: :destroy
  belongs_to :listing,
    dependent: :destroy

  validate :dates
  
private 

  def dates 
    if self.start_date.to_i > self.end_date.to_i
      errors.add(:dates, "start_date cannot be passed from end_date")
    end
  end

end
