require 'rails_helper'

describe Answer do
  it { should validate_presence_of :text }
  it { should belong_to :user}
  it { should belong_to :question}
end
