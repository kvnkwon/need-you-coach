class RemoveUserIdFromRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :user_id
  end
end
