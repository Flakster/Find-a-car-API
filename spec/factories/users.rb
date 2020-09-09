# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email 'foobar@mail.com'
    password 'foobar'
  end
  factory :admin, { parent: :user } do
    name 'admin'
    email 'admin@mail.com'
    password 'foobar'
    admin true
  end
end
