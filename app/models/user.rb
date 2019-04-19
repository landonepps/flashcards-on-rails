class User < ApplicationRecord
  has_many :tasks
  has_and_belongs_to_many :tags

  has_secure_password
end
