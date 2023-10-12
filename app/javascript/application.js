// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "trix"
import "@rails/actiontext"

import SlimSelect from 'slim-select'

document.addEventListener('DOMContentLoaded', () => {
  const tagSelect = new SlimSelect({
    select: '#tag_ids',
    settings: {
      placeholderText: 'Выберите теги',
    }, // Настройте placeholder по вашему усмотрению
    allowDeselect: true, // Настройки SlimSelect по вашему выбору
    // Другие настройки SlimSelect...
  });
});




 