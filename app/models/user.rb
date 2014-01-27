class User < ActiveRecord::Base
  has_secure_password
  before_create :create_remember_token

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  private

    def create_remember_token
      self.remember_token = User.new_remember_token
    end
end
