class User < ApplicationRecord
  enum role: {basic: 0, moderator: 1, admin: 2}, _suffix: :role





  has_many :faqs, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  devise :database_authenticatable, :authentication_keys => [:email]
end
