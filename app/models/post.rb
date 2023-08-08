class Post < ApplicationRecord
  belongs_to :user

  has_many :commentaries, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :post_categories, dependent: :destroy

  has_many_attached :images

  validates :title, presence: :true
  validates :content, presence: :true
end
