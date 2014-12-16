class User < ActiveRecord::Base
  has_many :requests, foreign_key: 'student_id'
  has_many :requests, foreign_key: 'coach_id'
end
