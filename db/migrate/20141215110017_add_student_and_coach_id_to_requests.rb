class AddStudentAndCoachIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :student_id, :integer
    add_column :requests, :coach_id, :integer
  end
end
