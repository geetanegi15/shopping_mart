class ApplicationController < ActionController::API
  include ActionView::Layouts
      def not_found
        render json: { error: 'not_found' }
      end
      def authenticate_account
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          @decoded = JsonWebToken.decode(header)
          @current_user = Account.find(@decoded[:martuser_id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { errors: e.message }, status: :unauthorized
        end
      end
    end
