class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.bundle
      redirect_to current_user.bundle
    else
      redirect_to new_bundle_path
    end
  end
end