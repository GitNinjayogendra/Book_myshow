class User < ApplicationRecord
  enum role: { user: "user" ,admin: "admin" }
   # enum role: [:user, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username , :password, :email, :contactnumber, presence: true
  validates :password, format: { with: /\A.*(?=.*\d)(?=.*[!@#$%^&*]).*\z/, message: 'must contain at least one digit and one special character' } 
  validates :email   , format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'must be a valid email address' }    
  validates :contactnumber , format: { with: /\A\d+\z/, message: 'must only contain numbers' }  
end
