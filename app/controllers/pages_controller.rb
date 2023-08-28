class PagesController < ApplicationController
  def index
  end

  def contact
    @users = User.all
  end
end
