class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :image
      t.integer :github_id
      t.string :facbook_id

      t.timestamps
    end
  end
end
