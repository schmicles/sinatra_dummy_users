class User < ActiveRecord::Base
  # Remember to create a migration!
  def self.valid?(email)
    User.exists?(email: email)
  end

  def authenticate!
    user = User.first(params[:email][:password])

    if user.nil?
      fail!("The username you entered does not exist.")
    elsif user.authenticate(params[:email][:password])
      success!(user)
    else
      fail!("Could not log in")
    end
  end

  def authenticate(attempted_password)
    if self.password == attempted_password
      true
    else
      false
    end
  end

end
