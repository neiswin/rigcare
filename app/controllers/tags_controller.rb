# app/controllers/tags_controller.rb
class TagsController < ApplicationController
  def search
    query = params[:query]
    tags = Tag.where('title LIKE ?', "%#{query}%").pluck(:title, :id)
    render json: tags
  end
end
