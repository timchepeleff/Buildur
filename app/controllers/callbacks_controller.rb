class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    binding.pry
    sign_in_and_redirect @user
  end
end
