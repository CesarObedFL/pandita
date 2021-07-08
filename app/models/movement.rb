class Movement < ApplicationRecord
  belongs_to :user
  
  validates :user, presence: true
  validates :operation, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
