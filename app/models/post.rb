class Post < ApplicationRecord
  # belongs_to :user

  # has_many :commentaries, dependent: :destroy
  # has_many :feedbacks, dependent: :destroy
  # has_many :post_category, dependent: :destroy

  # has_one_attached :image

  validates :title, presence: :true
  validates :content, presence: :true
end
