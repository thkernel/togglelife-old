# == Schema Information
#
# Table name: profiles
#
#  id                 :bigint           not null, primary key
#  first_name         :string
#  last_name          :string
#  gender             :string
#  birth_date         :date
#  full_address       :string
#  street             :string
#  state              :string
#  city               :string
#  country            :string
#  latitude           :float
#  longitude          :float
#  presentation       :text
#  marital_status     :string
#  height             :float
#  weight             :float
#  eyes               :string
#  hair               :string
#  sexual_orientation :string
#  occupation         :string
#  astrology          :string
#  religion           :string
#  purpose            :string
#  user_id            :bigint           not null
#  identifier         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Profile < ApplicationRecord
	# Include shared utils.
	include SharedUtils::Model
   
	before_save :generate_random_number_uid
	
	belongs_to :user

	# For active storage
	has_one_attached :avatar
	validates :gender, presence: true
	validates :city, presence: true
	validates :country, presence: true

	#validates :identifier, presence: true, uniqueness: true

end
