# frozen_string_literal: true

class Car < ApplicationRecord
  # model association
  has_many :favorites, dependent: :destroy

  # validations
  validates_presence_of :make, :color, :year, :price
end
