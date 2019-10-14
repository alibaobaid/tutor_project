class Level < ApplicationRecord
  include LevelPresenter
  # validation
  validates_presence_of :name
  validates :name, uniqueness: true

end
