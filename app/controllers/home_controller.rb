class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    #byebug
    if user_signed_in?
    end
  end
end
