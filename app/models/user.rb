class User < ApplicationRecord

  has_many :lists, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  after_create :add_default_lists

  private

  def add_default_lists
    self.lists.create(title: 'ToDo')
    self.lists.create(title: 'Doing')
    self.lists.create(title: 'Done')
  end
end
