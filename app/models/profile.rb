class Profile < ApplicationRecord
  belongs_to :user
  has_many :ideas
  has_many :reviews, dependent: :destroy

  validates :first_name, :last_name, presence: true
end
