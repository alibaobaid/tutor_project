class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.text :content
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :is_new, default: true
      
      t.timestamps
    end
  end
end
