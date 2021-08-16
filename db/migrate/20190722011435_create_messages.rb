class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :uid
    	t.text :content
      t.references :conversation, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :send_at
      t.datetime :readed_at
    	t.timestamps 
    end
  end
end
