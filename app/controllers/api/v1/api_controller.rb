module Api::V1
  class ApiController < ::ApplicationController
    before_filter :set_resource_owner
    # before_filter :authenticate_user_from_token!

    def set_resource_owner
      render_unauthorized unless @resource_owner = User.find_by(email: params[:email])
    end

    def current_user
      current_api_v1_user
    end

    protected
    def authenticate_user_from_token!
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      email = params[:email].presence
      user  = email && User.find_by_email(email)

      # We use Devise.secure_compare to compare the token in the database
      # with the token given in the params, mitigating timing attacks.
      if user && Devise.secure_compare(user.authentication_token, params[:authentication_token])
        sign_in user, store: false
      end
    end

    def render_unauthorized
      render json: 'Invalid token', status: Rack::Utils.status_code(:unauthorized)
    end
  end
end