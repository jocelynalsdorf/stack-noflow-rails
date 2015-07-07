require 'rails_helper'

describe "the signup a new user process" do
  it "adds a new question" do
    user = FactoryGirl.create(:user)
    visit questions_path
    click_link 'Sign Up'
    fill_in 'Name', :with => user.name
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    fill_in 'Password confirmation', :with => user.password
    click_on 'Sign Up Now'
    expect(page).to have_content 'Ask a Question'
  end

  it "gives an error when no data is entered into form fields" do
    user = FactoryGirl.create(:user)
    visit questions_path
    click_link 'Sign Up'
    fill_in 'Name', :with => user.name
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    fill_in 'Password confirmation', :with => user.password
    click_on 'Sign Up Now'
    click_link 'Ask a Question'
    visit new_question_path
    click_on 'Create Question'
    expect(page).to have_content 'errors'
  end

end
