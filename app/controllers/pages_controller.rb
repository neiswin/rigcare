class PagesController < ApplicationController
  def contact
    @users = User.all.decorate
  end


  def index
    @faqs = Faq.last(5)
  end


  def test
    
  end
end
