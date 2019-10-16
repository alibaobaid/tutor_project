class City < ApplicationRecord
  include CityPresenter
    
  # Association
  belongs_to :country
  has_many :users, dependent: :destroy
  
  # Validation
  validates_presence_of :name
  validates :name, uniqueness: true
end
