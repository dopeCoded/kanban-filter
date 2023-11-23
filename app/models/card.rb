class Card < ApplicationRecord
  belongs_to :list
  validates :title, length: { in: 1..255 }, presence: { message: 'は必須です' }
  validates :memo,  length: { maximum: 1000 }
  validates :importance, inclusion: { in: ['high', 'medium', 'low'], allow_nil: true }
end
