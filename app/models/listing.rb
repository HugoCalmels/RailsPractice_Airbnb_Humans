class Listing < ApplicationRecord
  belongs_to :user,
    dependent: :destroy
  belongs_to :admin, class_name: 'User',
    dependent: :destroy
  belongs_to :city,
    dependent: :destroy
  has_many :reservations,
    dependent: :destroy


  validates :available_beds,
    presence: true,
    numericality: { greater_than: 0 }

  validates :price,
    presence: true,
    numericality: { greater_than: 0 },
    numericality: { only_integer: true }

  validates :description,
    presence: true,
    length: { minimum: 140 }

  validates :welcome_message,
    presence: true
end
