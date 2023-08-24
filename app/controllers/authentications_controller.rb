class AuthenticationsController < ApplicationController
    before_action :authenticate_account, except: :login
    def login
        byebug
      @account = Account.find_by_email(params[:email])
      if @account&.authenticate(params[:password])
        token = JsonWebToken.encode(account_id: @account.id)
        time = Time.now + 24.hours.to_i
        render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                       user_name: @account.user_name }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end
    private
    def login_params
      params.permit(:email, :password)
    end
  end





