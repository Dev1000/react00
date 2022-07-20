class ApplicationController < ActionController::Base

  protected

  # Redirect after successfully login
  def after_sign_in_path_for(resource_or_scope)
    users_dashboard_path(resource_or_scope)
  end

  # Redirect to login page after sign out
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
