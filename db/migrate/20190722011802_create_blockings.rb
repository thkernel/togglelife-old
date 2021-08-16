class CreateBlockings < ActiveRecord::Migration[5.2]
  def change
    create_table :blockings do |t|
      t.string :uid
      t.string :reason
      t.text :description
      t.references :sender, index: true
    	t.references :recipient, index: true
      t.string :status


      t.timestamps
    end
  end
end
