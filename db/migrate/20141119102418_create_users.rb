class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :uid
      t.string :email
      t.string :avatar_url
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
