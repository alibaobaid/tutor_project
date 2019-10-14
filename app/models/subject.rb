class Subject < ApplicationRecord
  include SubjectPresenter
  # validation
  validates_presence_of :name
  validates :name, uniqueness: true

end
