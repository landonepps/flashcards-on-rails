class Task < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags

  enum status: [:not_started, :started, :complete]
  enum priority: [:none, :low, :medium, :high]
end
