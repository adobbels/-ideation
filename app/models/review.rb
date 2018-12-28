class Review < ApplicationRecord
  belongs_to :idea
  belongs_to :profile

  validates :title, :content, :rating, presence: true
end
