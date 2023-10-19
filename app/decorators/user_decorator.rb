class UserDecorator < Draper::Decorator
  delegate_all

  def position_text
    case position
    when 1
      return "Инженер"
    when 2
      return "Мастер"
    when 3
      return "Слесарь КИПиА"
    when 4
      return "Электромонтер"
    when 5
      return "Рукодство"
    else
      return "Неизвестно"
    end
  end

  def department_text
    case position
    when 1
      return "СКУ"
    when 2
      return "КТОиСА"
    when 3
      return "Электроцех №3"
    else
      return "Неизвестно"
    end
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
