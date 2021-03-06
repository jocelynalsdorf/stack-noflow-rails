require 'rails_helper'


describe "the delete a question process" do
  it "deletes a question" do
    visit questions_path
    click_link 'Sign Up'
    question = FactoryGirl.build(:question)
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
    click_link 'Delete Question'
    expect(page).to have_content 'All Questions'
  end


end
