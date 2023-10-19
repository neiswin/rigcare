class FaqsController < ApplicationController
  before_action :set_book!, only: %i[destroy edit show update]
  before_action :fetch_rigs, only: %i[create edit new]
  before_action :fetch_tags, only: %i[create edit new]

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

  def search
    if params[:title_search].present?
      search_query = params[:title_search]
      @faqs = Faq.filter_by_title(search_query)
    else
      @faqs = []
    end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("search_result",
                                          partial: "faqs/partial/search_result", locals: {faqs: @faqs})
      end
    end
  end

  def edit
  end

  def update
    if @faq.update faq_params
      flash[:success] = 'FAQ update!'
      redirect_to faqs_path
    else
      render :edit
    end
  end

  def destroy
    @faq.destroy
    flash[:success] = 'FAQ deleted!'
    redirect_to faqs_path
  end

  private
  

  def set_book!
    @faq = Faq.find params[:id]
  end

  def fetch_rigs
    @rigs = Rig.order(:name).map { |rig| [rig.rig_type, rig.id] }
  end

  def fetch_tags
    @tags = Tag.all
  end

  def faq_params
    params.require(:faq).permit(:title, :body, :rig_id, tag_ids: [])
  end
  
end
