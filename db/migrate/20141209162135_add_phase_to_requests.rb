class AddPhaseToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :phase, :integer
  end
end
