class FaqsController < ApplicationController
  before_action :set_book!, only: %i[destroy edit show update]

  def index
    @faqs = Faq.all
  end

  def new
    @faq = Faq.new
  end

  def create
        
    if user_signed_in?
      @faq = current_user.faqs.build faq_params
    else
      @faq = Faq.new faq_params
    end

    if @faq.save
      flash[:success] = 'FAQ added!'
      redirect_to faqs_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  

  def set_book!
    @faq = Faq.find params[:id]
  end

  def faq_params
    params.require(:faq).permit(:title, :body)
  end
end
