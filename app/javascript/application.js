// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "trix"
import "@rails/actiontext"
import SlimSelect from 'slim-select'


import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


document.addEventListener('DOMContentLoaded', () => {
  const tagSelectElement = document.querySelector('#tag_ids');
  
  if (tagSelectElement) {
    const tagSelect = new SlimSelect({
      select: tagSelectElement,
      settings: {
        placeholderText: 'Выберите теги',
      },
      allowDeselect: true,
      // Другие настройки SlimSelect...
    });
  }
});





 