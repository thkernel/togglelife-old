class CreateConversations < ActiveRecord::Migration[5.2]
  def change
   create_table :conversations do |t|
   	 t.string :uid
     t.references :sender, index: true, :null => false
     t.references :recipient, index: true, :null => false
     t.timestamps 
   end
 end
end
