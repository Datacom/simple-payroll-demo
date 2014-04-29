class User < ActiveRecord::Base
  has_many :timesheets,     :dependent => :destroy, :inverse_of => :user
  has_many :leave_requests, :dependent => :destroy, :inverse_of => :user
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
