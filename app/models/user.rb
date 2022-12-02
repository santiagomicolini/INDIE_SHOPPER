class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :shops, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :basket, dependent: :destroy
  has_many :reservations, dependent: :destroy


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
