class User < ApplicationRecord
  extend Enumerize
  include UserPresenter

  # encrypt password
  has_secure_password

  has_one_attached :avatar

  GENDER = { male: 1, female: 2 }
  ROLE_TYPES = { tutor: 1, student: 2 }
  STATUS = { active: 1, inactive: 2 }


  # Association
  belongs_to :city
  belongs_to :country, optional: true
  belongs_to :level, optional: true
  belongs_to :subject, optional: true

  # Validations
  validates_presence_of :first_name, :last_name, :email, :password_digest, :role_type
  validates_uniqueness_of :email
  validate :avatar_present?
  enumerize :role_type, in: ROLE_TYPES, scope: true, predicates: { prefix: true }
  enumerize :gender, in: GENDER, scope: true, predicates: { prefix: true }
  enumerize :status, in: STATUS, scope: true, predicates: { prefix: true }

  # to get the current logged in user form any model (just call User.current)
  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def can_update_profile?
    User.current == self
  end

  def avatar_url
    avatar.attached? ? url : ''
  end

  def url
    Rails.application.routes.url_helpers.rails_blob_path(avatar, only_path: true)
  end

  def country_name
    self.country.name
  end

  def city_name
    self.city.name
  end

  def level_name
    self.level.name
  end

  def subject_name
    self.subject.name
  end

  def new_notification_count
    Notification.receiver(User.current.id)
                .not_readed
                .count
  end

  private

  def avatar_present?
    errors.add(:avatar, :blank) unless avatar.attached?
  end

end
