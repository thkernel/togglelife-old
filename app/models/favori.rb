# == Schema Information
#
# Table name: favoris
#
#  id           :bigint           not null, primary key
#  sender_id    :bigint           not null
#  recipient_id :bigint           not null
#  status       :string           default("enable")
#  removed_at   :datetime
#  identifier   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Favori < ApplicationRecord
    # Include shared utils.
   include SharedUtils::Model
   
   before_save :generate_random_number_uid
   
    belongs_to :sender, :foreign_key => "sender_id", :class_name => "User"
    belongs_to :recipient, :foreign_key => "recipient_id", :class_name => "User"

    #validates :identifier, presence: true, uniqueness: true

    def self.current_user_favoris(user_id)
		where("sender_id = ? ",user_id)
    end
    
end
