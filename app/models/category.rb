class Category < ApplicationRecord
  has_many :post_category, dependent: :destroy

  validates :name, presence: :true, uniqueness: :true
  validates :description, presence: :true, uniqueness: :true
end
