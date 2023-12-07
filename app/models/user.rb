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
  validates :department, presence: true
  validates :position, presence: true
  devise :database_authenticatable, :authentication_keys => [:email]
  has_one_attached :avatar
  validate :validate_avatar_format

  
  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize_to_fill: [250, nil,  { crop: :attention}]).processed
    else
      "default_profile.png"
    end
  end
  
  private

  def validate_avatar_format
    return unless avatar.attached?

    unless avatar.image? && %w[image/jpeg image/png].include?(avatar.content_type)
      errors.add(:avatar, 'должен быть файлом формата JPG или PNG')
    end
  end
  
  
end
