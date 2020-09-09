# frozen_string_literal: true

class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # model association
  has_many :favorites, dependent: :destroy
  has_many :cars, through: :favorites

  # validations
  validates_presence_of :name, :password_digest
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[^@\s]+@[^@\s\.]+\.[^@\.\s]+\z/, message: 'must be valid' }
end
