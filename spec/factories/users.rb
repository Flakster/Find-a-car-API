# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email 'foobar@mail.com'
    password 'foobar'
  end
end
