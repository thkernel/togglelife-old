module FlirtsHelper
    def is_flirt(user)
        user = User.find_by(slug: user.slug)
        if user.present?
            existing_flirt = find_flirt(user.id)
            if existing_flirt.present? 
                if existing_flirt.status = "pending"
                    "pending"
                elsif existing_flirt.status = "accepted"
                    "accepted"
                end
            end
        end

        
    end

    def find_flirt(recipient_id)
        flirts = Flirt.current_user_flirts(current_user.id)
        if flirts.present?
            flirt = flirts.where(["recipient_id = ? OR sender_id = ?", recipient_id, recipient_id]).take
        end
    end
end
