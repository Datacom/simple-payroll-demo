module Api::V1
  class LeaveRequestsController < ApiController
    # GET /leave_requests
    # GET /leave_requests.json
    def index
      # @leave_requests = current_user.leave_requests
      @leave_requests = @resource_owner.leave_requests
      render json: @leave_requests
    end

    # GET /leave_requests/1
    # GET /leave_requests/1.json
    def show
      @leave_request = LeaveRequest.find(params[:id])
      render json: @leave_request
    end
  end
end