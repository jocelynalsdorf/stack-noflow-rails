require 'rails_helper'

describe "the add a question process" do
  it "adds a new question" do
    visit questions_path
    click_link 'Sign Up'
    user = FactoryGirl.build(:user)
    question = FactoryGirl.build(:question)
    fill_in 'Name', :with => user.name
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    fill_in 'Password confirmation', :with => user.password
    click_on 'Sign Up Now'
    click_link 'Ask a Question'
    fill_in 'Title', :with => question.title
    fill_in 'Content', :with => question.content
    click_on 'Create Question'
    expect(page).to have_content question.title
  end

  it "gives an error when no data is entered into form fields" do
    visit questions_path
    click_link 'Sign Up'
    question = FactoryGirl.build(:question)
    fill_in 'Name', :with => question.user.name
    fill_in 'Email', :with => question.user.email
    fill_in 'Password', :with => question.user.password
    fill_in 'Password confirmation', :with => question.user.password
    click_on 'Sign Up Now'
    click_link 'Ask a Question'
    click_on 'Create Question'
    expect(page).to have_content 'errors'
  end

end
