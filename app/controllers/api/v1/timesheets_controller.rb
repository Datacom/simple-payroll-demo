module Api::V1
  class TimesheetsController < ApiController
    # GET /timesheets
    # GET /timesheets.json
    def index
      @timesheets = Timesheet.all
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
