module Api::V1
  class SessionsController < Devise::SessionsController
    def create
      user = User.find_by(email: session_params[:email])

      if user && user.valid_password?(session_params[:password])
        user.ensure_authentication_token!
        render  json: { authentication_token: user.authentication_token, user_id: user.id }, 
                status: Rack::Utils.status_code(:ok)
      else
        return invalid_credentials
      end
    end

    def destroy
      # user = User.find_by authentication_token: params[:authentication_token]
      user = User.find_by email: params[:email]
      if user
        user.reset_authentication_token!
        render :json => { :message => ["Session deleted"] },  :success => true, status: Rack::Utils.status_code(:ok)
      else
        return invalid_token
      end
    end

    private
    def session_params
      params.permit(:email, :password, :authentication_token)
    end

    def invalid_credentials
      render :json => { errors: ["Invalid email or password"] }, success: false, status: Rack::Utils.status_code(:unauthorized)
    end

    def invalid_token
      render json: { errors: ["Logout Failed"] }, success: false, status: Rack::Utils.status_code(:unauthorized)
    end
  end
end