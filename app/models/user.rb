class User < ActiveRecord::Base
  has_secure_password

  has_many :questions
  has_many :answers
  validates :name, :presence => true
  validates :email, :presence => true
  after_create :send_signup_confirmation

def send_signup_confirmation
    UserMailer.signup_confirmation(self).deliver_now
  end

end
