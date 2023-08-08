class Category < ApplicationRecord
  has_many :post_categories, dependent: :destroy

  validates :name, presence: :true, uniqueness: :true
  validates :description, presence: :true, uniqueness: :true
end
