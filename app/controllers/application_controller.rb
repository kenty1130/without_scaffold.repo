class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def after_signin_path_for(resource)
    # super(resource)
    my_threads_path
  end
end
