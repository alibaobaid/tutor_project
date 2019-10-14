class Country < ApplicationRecord
  include CountryPresenter
  # Association
  has_many :cities, dependent: :destroy 

  # validations
  validates_presence_of :name
  validates :name, uniqueness: true
end
