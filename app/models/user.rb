class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions
  has_many :comments

  acts_as_voter

  # def self.from_omniauth(auth)
  # 	where(auth.slice(:provider, :uid)).first_or_create do |user|
  # 		user.provider = auth.provider
  # 		user.uid = auth.uid
  # 	end
  # end


  def self.connect_to_linkedin(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else

        user = User.create(name:auth.info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
      end

    end
  end   
  # def self.new_with_session(params, session)
  # 	if session["devise.user_attributes"]
  # 		new(session["devise.user_attributes"], without_protection: true) do |user|
  # 			user.attributes = params
  # 			user.valid?
  # 		end
  # 	else
  # 		super
  # 	end
  # end

  # # Allows users to not have to input a password
  # def password_required?
  # 	super && provider.blank?
  # end

  # def update_with_password(params, *options)
  # 	if encrypted_password.blank?
  # 		update_attributes(params, *options)
  # 	else
  # 		super
  # 	end
  # end
end
