class Idea < ApplicationRecord
  belongs_to :profile
  has_many :reviews, dependent: :destroy

  validates :title, :business_case, :value_prop, :target_market, :problem, :solution, :revenue, :status, :line, presence: true
end
