require 'rails_helper'

RSpec.describe City, type: :model do
  # Association test
  it { should belong_to(:country) }

  # Validation test
  it { should validate_presence_of(:name) }
end
