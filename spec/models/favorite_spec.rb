# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  # Association test
  # ensure a favorite record belongs to a single car record
  it { should belong_to(:car) }
  # ensure a favorite record belongs to a single user record
  it { should belong_to(:user) }
end
