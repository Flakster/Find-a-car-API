# frozen_string_literal: true

class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # model association
  has_many :favorites, dependent: :destroy

  # validations
  validates_presence_of :name, :email, :password_digest
end
