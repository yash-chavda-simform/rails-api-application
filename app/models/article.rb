class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :release_date, presence: true
end
  