require 'rails_helper'

describe "the edit an answer process" do
  it "adds a new answer" do
  visit questions_path
    click_link 'Sign Up'
    question = FactoryGirl.build(:question)
    answer = FactoryGirl.build(:answer)
    fill_in 'Name', :with => question.user.name
    fill_in 'Email', :with => question.user.email
    fill_in 'Password', :with => question.user.password
    fill_in 'Password confirmation', :with => question.user.password
    click_on 'Sign Up Now'
    click_link 'Ask a Question'
    fill_in 'Title', :with => question.title
    fill_in 'Content', :with => question.content
    click_on 'Create Question'
    click_link question.title
    click_link 'Add an Answer'
    fill_in 'Text', :with => answer.text
    click_on 'Create Answer'
    click_on answer.text
    click_on 'Edit'
    fill_in 'Text', :with => 'changed answer'
    click_on 'Update Answer'
    expect(page).to have_content 'changed answer'
  end

  it "gives an error when no data is entered into form fields" do
    visit questions_path
    click_link 'Sign Up'
    question = FactoryGirl.build(:question)
    answer = FactoryGirl.build(:answer)
    fill_in 'Name', :with => question.user.name
    fill_in 'Email', :with => question.user.email
    fill_in 'Password', :with => question.user.password
    fill_in 'Password confirmation', :with => question.user.password
    click_on 'Sign Up Now'
    click_link 'Ask a Question'
    fill_in 'Title', :with => question.title
    fill_in 'Content', :with => question.content
    click_on 'Create Question'
    click_link question.title
    click_link 'Add an Answer'
    fill_in 'Text', :with => answer.text
    click_on 'Create Answer'
    click_on answer.text
    click_on 'Edit'
    fill_in 'Text', :with => ''
    click_on 'Update Answer'
    expect(page).to have_content 'error'
  end

end
