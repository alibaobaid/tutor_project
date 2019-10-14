require 'rails_helper'

RSpec.describe Country, type: :model do
  # Association test
  it { should have_many(:cities).dependent(:destroy) }
 
  # Validation tests
  it { should validate_presence_of(:name) }
end
