class TestsController < ApplicationController
  def index
    if params[:query].present?
      search_query = "%#{params[:query]}%"
      @tests = Test.where("name LIKE ?", search_query)
    else
      @tests = Test.all
    end
  end
end
