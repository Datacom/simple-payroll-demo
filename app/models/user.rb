class User < ActiveRecord::Base
  has_many :timesheets,     dependent: :destroy, inverse_of: :user
  has_many :leave_requests, dependent: :destroy, inverse_of: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable,
  # :recoverable, :rememberable, :trackable,
  devise :database_authenticatable, :registerable, :validatable

  def ensure_authentication_token!
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token!
      self.save!
    end
  end

  def reset_authentication_token!
    self.authentication_token = nil
    self.save!
  end

  private
  def generate_authentication_token!
    loop do
      token = Devise.friendly_token
      break token unless User.find_by(authentication_token: token)
    end
  end
end
