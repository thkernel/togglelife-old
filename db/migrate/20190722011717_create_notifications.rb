class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :uid
      t.string :title
      t.text :content
      t.references :sender, index: true
      t.references :recipient, index: true
      t.boolean :read, default: false 
      t.datetime :read_at
      t.string :status
      

      t.timestamps
    end
  end
end
