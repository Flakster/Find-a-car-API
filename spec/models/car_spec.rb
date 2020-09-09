# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car, type: :model do
  # Association test
  # ensure Car model has a 1:m relationship with the favorite model
  it { should have_many(:favorites).dependent(:destroy) }
  # Validation tests
  # ensure columns make, color, year, and price are present before saving
  it { should validate_presence_of(:make) }
  it { should validate_presence_of(:color) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:price) }
end
