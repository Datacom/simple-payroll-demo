class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.references  :user
      t.references  :project
      t.datetime    :start_date
      t.datetime    :end_date
      t.datetime    :submitted_at
      t.timestamps
    end
  end
end
