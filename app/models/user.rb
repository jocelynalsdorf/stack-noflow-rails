class User < ActiveRecord::Base
  has_secure_password
  attr_accessor :password, :password_confirmation

  has_many :questions
  has_many :answers
  validates :name, :presence => true
  validates :email, :presence => true
  validates_uniqueness_of :email


end
