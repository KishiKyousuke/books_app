class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :postal_code, length: { maximum: 7 }
  validates :introduction, length: { maximum: 120 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
