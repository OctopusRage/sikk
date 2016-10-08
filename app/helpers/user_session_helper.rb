module UserSessionHelper
  def authorize_user
    render json: {
      status: 'fail',
      message: 'Unauthorized Access',
      data: {
        message: 'Unauthorized Access'
      }
    }, status: 403 unless current_user
  end

  def current_user
    current_consumer || current_consultant
  end

  def current_consumer
    @current_consumer ||= token_authentication(:consumer)
  end

  def current_consultant
    @current_consultant ||= token_authentication(:consultant)
  end

  def current_provider
    @current_provider ||= (current_consumer.providers.find_by(request.headers["Provider"]) || 
      current_consumer.providers.first) if current_consumer
  end

  def current_role
    if current_consumer
      return 'Consumer'
    elsif current_consultant
      return 'Consultant'
    else
      return nil
    end
  end

  def save_userapp(user)
    authenticate_with_http_token do |token, options|
      if platform=options[:platform]
        build_version = options[:build_version]
        app_version = options[:app_version]
        user_app = user.user_apps.find_or_create_by(platform:platform.downcase)
        user_app.update!(build_version: build_version,app_version: app_version)
      end 
    end
  end  

  def token_authentication(class_name)
    klass = class_name.to_s.classify.constantize
    authenticate_with_http_token do |token, options|
      klass.find_by(authentication_token: token)
    end
  end

  def current_lang
    @current_lang ||= (request.headers["Lang"] || "en")
  end

  def current_platform
    @current_platform ||= request.headers["Platform"]
  end

  def current_currency
    @current_currency ||= request.headers["Currency"]
  end
end
