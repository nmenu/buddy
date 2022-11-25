class User < ApplicationRecord
  has_many :my_offers, foreign_key: 'user_id', class_name: 'Offer', dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :offers, through: :bookings, dependent: :destroy

  has_one_attached :photo
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
