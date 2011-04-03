class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nickname
  
  has_many :articles
  has_many :comments

  validates :nickname, :presence => true, :uniqueness => true, :length => { :minimum => 3, :maximum => 15 }

  def admin?
    self.nickname == "Admin"
  end
end
