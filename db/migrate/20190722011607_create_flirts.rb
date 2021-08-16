class CreateFlirts < ActiveRecord::Migration[5.2]
  def change
    create_table :flirts do |t|
      t.string :uid
      t.references :sender, index: true
    	t.references :recipient, index: true
      t.text :description
      t.string :status
      t.datetime :accepted_at
      t.datetime :removed_at

      t.timestamps
    end
  end
end
