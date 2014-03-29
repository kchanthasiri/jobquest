class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def linkedin
		# user = User.from_omniauth(request.env["omniauth.auth"])
		# if user.persisted?
		# 	flash.notice = "Signed in!"
		# 	sign_in_and_redirect user
		# else
		# 	session["devise.user_attributes"] = user.attributes
		# 	redirect_to new_user_registration_url
		# end

		auth = env["omniauth.auth"]
    	@user = User.connect_to_linkedin(request.env["omniauth.auth"],current_user)
	    if @user.persisted?
	      flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
	      sign_in_and_redirect @user, :event => :authentication
	    else
	      session["devise.twitter_uid"] = request.env["omniauth.auth"]
	      redirect_to new_user_registration_url
    	end
	end
end
