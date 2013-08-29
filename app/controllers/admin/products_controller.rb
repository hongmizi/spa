class Admin::ProductsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_is_admin

  def index

  end

  def show

  end

  private 
  def ensure_is_admin
    if !current_user.has_role? :admin
      return redirect_to root_path, alert: "You don't have permission."
    end

  end
end
