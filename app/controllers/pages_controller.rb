class PagesController < ApplicationController
  def contact
    @users = User.all.decorate
  end


  def index
    @faqs = Faq.last(5)
  end


  def test
    if params[:query].present?
      search_query = "%#{params[:query]}%"
      @faqs = Faq.where("name LIKE ?", search_query)
    else
      @faqs = Faq.all
    end
  end
end
