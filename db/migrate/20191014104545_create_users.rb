class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :nationality
      t.integer :gender
      t.string :hour_amount
      t.text :bio
      t.integer :role_type
      t.string :email
      t.string :password_digest
      t.references :city, null: false, foreign_key: true
      t.references :level, null: true, foreign_key: true
      t.references :subject, null: true, foreign_key: true
      t.timestamps
    end
  end
end
