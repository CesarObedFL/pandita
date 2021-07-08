class User < ApplicationRecord
    has_secure_password
    # regular expresion to validate emials
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :age, numericality: { greater_than: 17 }
    validates :phone, numericality: { greater_than: 1000000000 }
    #validates :balance, presence: true

    has_many :movements
end
