class Card < ApplicationRecord
  belongs_to :list
  validates :title, length: { in: 1..255 }, presence: { message: 'は必須です' }
  validates :memo,  length: { maximum: 1000 }
end
