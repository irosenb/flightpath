class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
    session['devise.twitter_data'] = request.env["omniauth.auth"].except("extra")
    sign_in(:user, @user)
    set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    redirect_to new_user_flight_path(@user)
  end
  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  def failure
    super
  end

  # protected

  # The path used when omniauth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
