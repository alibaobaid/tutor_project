class User < ApplicationRecord
  include UserPresenter
  
  # encrypt password
  has_secure_password

  has_one_attached :avatar
  
  # Association
  belongs_to :city
  belongs_to :level, optional: true
  belongs_to :subject, optional: true

  # Validations
  validates_presence_of :first_name, :last_name, :email, :password_digest
  # validate :avatar_present?

  private

  # def avatar_present?
  #   errors.add(:avatar, :blank) unless avatar.attached?
  # end
end
