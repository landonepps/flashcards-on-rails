require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  it "shows task names on task list" do
    user = FactoryBot.create(:user)
    task1 = FactoryBot.create(:task, user: user)
    task2 = FactoryBot.create(:task, user: user)

    visit root_path

    expect(page).to have_content task1.name
    expect(page).to have_content task2.name
  end

  it "allows a user to create a new task" do
    user = FactoryBot.create(:user)
    tag = FactoryBot.create(:tag)
    user.tags << tag

    visit root_path
    click_link "New Task"
    fill_in "Name", with: "Sample task name"
    fill_in "Description", with: "Sample task description"
    # I want to test deadlines, but the format depends on Chrome's language settings
    # fill_in "task[deadline]", with: "10/22/2019"
    select "Low", from: "Priority"
    select tag.name, from: "Tags"
    click_button "Create Task"

    expect(page).to have_content "Task added"
    expect(page).to have_content "Sample task name"
    expect(page).to have_content "Sample task description"
    # form should default to tomorrow
    expect(page).to have_content Date.tomorrow.strftime('%-m/%-d')
    expect(page).to have_content "Low"
    expect(page).to have_content tag.name
  end

  it "allows a user to edit a task" do
    user = FactoryBot.create(:user)
    task = FactoryBot.create(:task, user: user)
    tag = FactoryBot.create(:tag)
    user.tags << tag

    visit root_path
    click_link task.name
    click_link "Edit"
    select "Started", from: "Status"
    fill_in "Name", with: "New task name"
    fill_in "Description", with: "New task description"
    select "High", from: "Priority"
    select tag.name, from: "Tags"
    click_button "Save Changes"

    expect(page).to have_content "Task updated"
    expect(page).to have_content "New task name"
    expect(page).to have_content "New task description"
    expect(page).to have_content "High"
    expect(page).to have_content tag.name
  end

  it "allows a user to delete a task" do
    # user is created implicitly
    task = FactoryBot.create(:task)

    visit root_path
    click_link task.name
    click_link "Edit"
    click_link "Delete"
    # we need to accept delete confirmation or selenium will complain
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "Task deleted"
    expect(page).to_not have_content task.name
  end
end
