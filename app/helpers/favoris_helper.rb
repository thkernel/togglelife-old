module FavorisHelper
    def is_favori?(user)
        user = User.find_by(slug: user.slug)
        if user.present?
            existing_favoris = find_favori(user.id)
            if existing_favoris.present? 
                
                    true
            else
                false
            end
        end

        
    end

    def find_favori(user_id)
        favoris = Favori.current_user_favoris(current_user.id)
        favori = favoris.where(recipient_id: user_id)
    end
    

end
