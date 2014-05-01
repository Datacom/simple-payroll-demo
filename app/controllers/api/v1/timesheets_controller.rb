module Api::V1
  class TimesheetsController < ApiController
    # GET /timesheets
    # GET /timesheets.json
    def index
      # @timesheets = current_user.timesheets
      @timesheets = @resource_owner.timesheets
      render json: @timesheets
    end

    # GET /timesheets/1
    # GET /timesheets/1.json
    def show
      @timesheet = Timesheet.find(params[:id])
      render json: @timesheet
    end
  end
end
