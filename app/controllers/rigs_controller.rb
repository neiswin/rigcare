class RigsController < ApplicationController
  def index
    @rigs = Rig.all
  end
  
  def show
    @rig = Rig.find params[:id]
    @faqs = @rig.faqs
  end
end