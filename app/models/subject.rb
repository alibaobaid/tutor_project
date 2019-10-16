class Subject < ApplicationRecord
  include SubjectPresenter
  
  # Association
  has_many :users, dependent: :destroy
  
  # validation
  validates_presence_of :name
  validates :name, uniqueness: true

end
