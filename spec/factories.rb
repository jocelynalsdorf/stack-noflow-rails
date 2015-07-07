FactoryGirl.define do


  factory(:user) do
    name('Jeanette')
    email('mean@gmail.com')
    password('1122')

  end


  factory(:question) do
    title('Weather')
    content('why is sky blue?')
    user
  end

  factory(:answer) do
    text('my answer')
     association :question, factory: :question, strategy: :build
  end
end
