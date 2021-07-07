class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :age, presence: true
    validates :phone, presence: true
    validates :balance, presence: true
end
