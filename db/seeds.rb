# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# TODO: Remove seed data. This is only for development.

user = User.create(username: "user1", password: "foobar",
                   password_confirmation: "foobar")

tag1 = user.tags.create(name: "tag1")
tag2 = user.tags.create(name: "tag2")

sample_task = Task.new(user_id: 1, name: "A sample task in progress",
                       deadline: 10.days.from_now,
                       priority: :low, status: :started)
sample_task.tags << tag1
sample_task.save

sample_task = Task.new(user_id: 1, name: "A completed high-priority sample task",
                       deadline: 14.days.from_now,
                       priority: :high, status: :complete)
sample_task.tags << tag1
sample_task.tags << tag2
sample_task.save

sample_task = Task.new(user_id: 1,
                       name: "A medium-priority sample task that hasn't been started",
                       deadline: 20.days.from_now,
                       priority: :medium, status: :not_started)
sample_task.tags << tag2
sample_task.save
