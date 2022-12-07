class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :shops, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :basket, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :user_chats
  has_many :chats, through: :user_chats
  validates :username, presence: true, uniqueness: true
  has_many :messages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
