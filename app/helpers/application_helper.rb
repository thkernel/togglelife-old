module ApplicationHelper
    def resource_name
	    :user
	end

	def resource
	    @resource ||= User.new
	end
	
	def resource_class
		User
  end
	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end

	def user_avatar(user, alt_tag, class_name)
		profile = user.profile

			 
		if profile.present? && profile.avatar.attached?
				image_tag profile.avatar,  class: class_name, alt: alt_tag
		else

				image_tag 'thumb/missing.png',  class: class_name, alt: alt_tag
		end
 
	end

end
