class LeaveRequest < ActiveRecord::Base
  belongs_to :user, :inverse_of => :leave_requests
  belongs_to :approver, :class_name => 'User', :foreign_key => 'approver_id'
end
