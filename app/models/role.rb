# == Schema Information
#
# Table name: roles
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :string
#  identifier  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ApplicationRecord
    # Include shared utils.
   include SharedUtils::Model
   
   before_save :generate_random_number_uid

   #validates :identifier, presence: true, uniqueness: true

   
end
