class Timesheet < ActiveRecord::Base
  belongs_to :user,    inverse_of: :timesheets
  belongs_to :project, inverse_of: :timesheets
end