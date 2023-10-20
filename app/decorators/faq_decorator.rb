class FaqDecorator < Draper::Decorator
  delegate_all

    def created_at
      helpers.content_tag :span, class: 'time' do
        object.created_at.strftime('%Y-%m-%d')
      end
    end

end
