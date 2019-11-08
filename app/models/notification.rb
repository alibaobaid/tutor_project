class Notification < ApplicationRecord
  include NotificationPresenter
  # Association
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"

  # validation
  validates_presence_of :content

  # Scopes
  scope :receiver, -> (id) { where(receiver_id: id) }
  scope :sender, -> (id) { where(sender_id: id) }
  scope :not_readed, -> { where(is_new: true) }

  def sender_name
    self.sender.first_name
  end
end
