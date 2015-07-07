require 'rails_helper'

describe "the add a question process" do
  it "adds a new question" do
    visit questions_path
    click_link 'Sign Up'
    fill_in 'Name', :with => 'joe'
    fill_in 'Email', :with => 'me@me.com'
    fill_in 'Password', :with => '11'
    fill_in 'Password confirmation', :with => '11'
    click_on 'Sign Up Now'
    click_link 'Ask a Question'
    fill_in 'Title', :with => 'Ruby'
    fill_in 'Content', :with => 'Ruby and rails?'
    click_on 'Create Question'
    expect(page).to have_content 'Ruby'
  end

  it "gives an error when no data is entered into form fields" do
    visit questions_path
    click_link 'Sign Up'
    fill_in 'Name', :with => 'joe'
    fill_in 'Email', :with => 'me@me.com'
    fill_in 'Password', :with => '11'
    fill_in 'Password confirmation', :with => '11'
    click_on 'Sign Up Now'
    click_link 'Ask a Question'
    visit new_question_path
    click_on 'Create Question'
    expect(page).to have_content 'errors'
  end

end
