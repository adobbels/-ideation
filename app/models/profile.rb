class Profile < ApplicationRecord
  belongs_to :user
  has_many :ideas
  has_many :reviews, dependent: :destroy
end
