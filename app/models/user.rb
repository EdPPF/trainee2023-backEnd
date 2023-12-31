class User < ApplicationRecord
  acts_as_token_authenticatable

  has_many :posts, dependent: :destroy
  has_many :commentaries, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  has_many_attached :images

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
