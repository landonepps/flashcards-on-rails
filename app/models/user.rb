class User < ApplicationRecord
  has_and_belongs_to_many :tags

  has_secure_password
end
