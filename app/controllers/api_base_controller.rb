class ApiBaseController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :authenticate

  private

  def authenticate
    return if current_api_key
    render json: { error: "Invalid or missing ApiKey" }, status: :unauthorized
  end

  def current_api_key
    key = request.env["HTTP_X_API_KEY"] || request.env["X-Api-Key"]
    @current_api_key ||= ApiKey.find_by(key: key)
  end
end
