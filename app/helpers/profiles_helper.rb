module ProfilesHelper
    def user_age(dob)
        if dob
            now = Time.now.utc.to_date
            "#{now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)} ans"
        end
    end
    def is_me?(user)
        if user && current_user.slug == user.slug
            true
        else
            false
        end
    end
    def user(slug)
        
        User.find_by(slug: slug)
    end
end
