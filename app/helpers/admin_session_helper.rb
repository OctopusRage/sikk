module AdminSessionHelper
  def authorize_admin
    render json: {
      status: 'fail',
      message: 'Unauthorized Access',
      data: {
        message: 'Unauthorized Access'
      }
    }, status: 403 unless current_admin
  end

  def current_admin
    @current_admin ||= token_authentication(:admin)
  end
end
