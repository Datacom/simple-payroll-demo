class CreateLeaveRequests < ActiveRecord::Migration
  def change
    create_table :leave_requests do |t|
      t.references  :user
      t.string      :type
      t.datetime    :start_date
      t.datetime    :end_date
      t.datetime    :approved_at
      t.references  :approver
      t.timestamps
    end
  end
end
