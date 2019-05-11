FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "Sample Task #{n}" }
    description "Sample task description."
    deadline 5.days.from_now
    priority :medium
    status :not_started

    association :user
  end
end
