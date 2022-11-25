class User < ApplicationRecord
  has_many :my_offers, foreign_key: 'user_id', class_name: 'Offer'
  has_many :my_bookings, through: :my_offers, source: :bookings
  has_many :bookings
  has_many :offers, through: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
