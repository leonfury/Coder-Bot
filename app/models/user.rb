class User < ApplicationRecord
	include Clearance::User
# enum access_level: [:user, :moderator, :superadmin]
 has_many :authentications, dependent: :destroy

# def check_avatar(user)
#      if user.image.nil?
#        return 'default image'
#     else
#        return user.avatar
#     end
# end
 def self.create_with_auth_and_hash(authentication, auth_hash)
   # if user == nil
   user = self.create!(
     first_name: auth_hash["info"]["first_name"],
     last_name: auth_hash["info"]["last_name"],
     email: auth_hash["info"]["email"],
     password: SecureRandom.hex(10),
     # avatar: params[:avatar]

   )
   
   user.remote_avatar_url = auth_hash["info"]["image"]
   user.save
   user.authentications << authentication
   return user
    end
  # end

 # grab google to access google for user data
 def google_token
   x = self.authentications.find_by(provider: 'google_oauth2')
   return x.token unless x.nil?
 end
end 
