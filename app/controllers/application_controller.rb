class ApplicationController < ActionController::Base
  private

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    if current_user.bundle
      current_user.bundle
    else
      new_bundle_path
    end
  end
end
