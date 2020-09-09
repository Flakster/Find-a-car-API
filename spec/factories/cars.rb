# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :car do
    make { Faker::Vehicle.make }
    color { Faker::Vehicle.color }
    year { Faker::Vehicle.year }
    price { Faker::Number.within(range: 5000..20_000) }
  end
end
