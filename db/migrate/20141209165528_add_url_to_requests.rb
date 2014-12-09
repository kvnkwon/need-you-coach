class AddUrlToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :url, :string
  end
end
