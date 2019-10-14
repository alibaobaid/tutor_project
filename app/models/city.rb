class City < ApplicationRecord
  include CityPresenter
    
  # Association
  belongs_to :country

  # validation
  validates_presence_of :name
  validates :name, uniqueness: true
end
