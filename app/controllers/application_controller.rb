class ApplicationController < ActionController::API
  # after_filter :cors_set_access_control_headers

  # def cors_set_access_control_headers
  #   headers['Access-Control-Allow-Origin'] = '*'
  #   headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH'
  #   headers['Access-Control-Request-Method'] = '*'
  #   headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  # end

  private
    def admin_authentication
      unless current_user.is_admin == true
        render json: {message:"Permission denied"}, status: :unauthorized
      end
    end
end
