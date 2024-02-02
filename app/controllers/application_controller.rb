class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

	def after_sign_in_path_for(resource)
    dashboards_path
  end

	protected
    add_flash_types :info, :error, :warning
end
