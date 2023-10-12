import { Controller } from "@hotwired/stimulus"
import SlimSelect from 'slim-select'
// import 'slim-select/dist/slimselect'


// Connects to data-controller="slim"
export default class extends Controller {
  connect() {

    new SlimSelect({
      select: this.element,
      settings: {
        placeholderText: 'Выберите теги',
        searchText: 'Ничего не нашлось',
        hideSelected: true,
      },
      allowDeselect: true,
    })
  }
}
