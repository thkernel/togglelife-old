class CreateFavoris < ActiveRecord::Migration[5.2]
  def change
    create_table :favoris do |t|
      t.string :uid
      t.references :sender, index: true
    	t.references :recipient, index: true
      t.string :status
      t.datetime :removed_at
      

      t.timestamps
    end
  end
end
