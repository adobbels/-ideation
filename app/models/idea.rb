class Idea < ApplicationRecord
  belongs_to :profile
  has_many :reviews, dependent: :destroy
end
