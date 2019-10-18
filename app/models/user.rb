class User < ApplicationRecord
  extend Enumerize
  include UserPresenter
  
  # encrypt password
  has_secure_password

  has_one_attached :avatar
  
  GENDER = { male: 1, female: 2 }

  ROLE_TYPES = { tutor: 1, student: 2 }

  # Association
  belongs_to :city
  belongs_to :country, optional: true
  belongs_to :level, optional: true
  belongs_to :subject, optional: true

  # Validations
  validates_presence_of :first_name, :last_name, :email, :password_digest, :role_type
  validates_uniqueness_of :email
  # validate :avatar_present?
  enumerize :role_type, in: ROLE_TYPES, scope: true, predicates: { prefix: true }
  enumerize :gender, in: GENDER, scope: true, predicates: { prefix: true }
  private

  # def avatar_present?
  #   errors.add(:avatar, :blank) unless avatar.attached?
  # end
  
end
