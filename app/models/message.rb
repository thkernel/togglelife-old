# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  body            :text             not null
#  read            :boolean          default(FALSE)
#  conversation_id :bigint           not null
#  user_id         :bigint           not null
#  send_at         :datetime
#  read_at         :datetime
#  identifier      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Message < ActiveRecord::Base
# Include shared utils.
include SharedUtils::Model
   
before_save :generate_random_number_uid

    belongs_to :conversation
    belongs_to :user
    validates_presence_of :body, :conversation_id
    #validates :identifier, presence: true, uniqueness: true

   
   private
    def self.conversation_messages(conversation_id)
        where("conversation_id = ? ",conversation_id)
    end
   
   
   end
