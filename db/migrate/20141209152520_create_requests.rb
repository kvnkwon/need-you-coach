class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user
      t.string :title
      t.text :problem_desc
      t.text :tried_desc

      t.timestamps
    end
  end
end
