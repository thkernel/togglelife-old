class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :uid
      t.string :first_name 
      t.string :last_name 
      t.string :gender
      t.date :birth_date 
      t.string :full_address
      t.string :street
      t.string :state
      t.string :city 
      t.string :country
      t.float  :latitude
      t.float  :longitude

      t.text :presentation 
      t.string :marital_status 
      t.float :height 
      t.float :weight 
      t.string :eyes 
      t.string :hair 
      t.string :sexual_orientation 
      t.string :occupation 
      t.string :astrology 
      t.string :religion 
      #t.string :nationality
      t.string :purpose 
      #t.attachment  :avatar
      t.references :user, foreign_key: true, null: false, index: {unique: true}
      t.timestamps
    end
  end
end
