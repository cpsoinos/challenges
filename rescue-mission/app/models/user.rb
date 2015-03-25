class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :questions
  has_many :answers

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})\z/}

  validates :password,
    presence: true,
    format: { with: /((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20})/}
end
