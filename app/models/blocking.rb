# == Schema Information
#
# Table name: blockings
#
#  id           :bigint           not null, primary key
#  reason       :string
#  sender_id    :bigint           not null
#  recipient_id :bigint           not null
#  status       :string           default("pending")
#  identifier   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Blocking < ApplicationRecord
   # Include shared utils.
   include SharedUtils::Model
   
   before_save :generate_random_number_uid

    belongs_to :sender, :foreign_key => "sender_id", :class_name => "User"
    belongs_to :recipient, :foreign_key => "recipient_id", :class_name => "User"

    #validates :identifier, presence: true, uniqueness: true

end
