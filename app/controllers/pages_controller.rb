class PagesController < ApplicationController
  # главная страница
  def home
  end

  # статические заглушки
  def mudpumps   # буровые насосы
  end

  def das        # СКПБ
  end

  def td         # Система верхнего привода
  end

  def drawwork   # лебёдка
  end

  # существующие:
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