class Country < ApplicationRecord
  include CountryPresenter
  # Association
  has_many :cities, dependent: :destroy
  has_many :users, dependent: :destroy 

  # validations
  validates_presence_of :name
  validates :name, uniqueness: true
end
