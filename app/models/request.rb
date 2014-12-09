class Request < ActiveRecord::Base
  validates :title, presence: true
  validates :problem_desc, presence: true
  validates :tried_desc, presence: true
  belongs_to :user
end
