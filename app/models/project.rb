class Project < ActiveRecord::Base
  has_many :timesheets, dependent: :destroy, inverse_of: :project
end
