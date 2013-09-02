class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_admin
  layout "admin"

  def show
  end

  private
    def ensure_user_is_admin
      if !current_user.has_role? :admin
        return redirect_to root_path, alert: "You are not admin"
      end
    end
end
