class Task < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags

  # set the default value for status to not_started
  # status isn't set on the new task page, so it needs a default
  attribute :status, :integer, default: :not_started

  enum status: [:not_started, :started, :complete]
  enum priority: [:high, :medium, :low]
end
