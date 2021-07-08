class User < ApplicationRecord
    validates :name, presence: true 
    validates :email, uniqueness: true
    validates :age, numericality: { greater_than: 17 }
    validates :phone, numericality: { greater_than: 1000000000 }
    #validates :balance, presence: true

    has_many :movements
end
