class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :login_id, null: false
      t.string :hashed_password, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
