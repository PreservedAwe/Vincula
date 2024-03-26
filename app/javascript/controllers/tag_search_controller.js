import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tag-search"
export default class extends Controller {

  static targets = ["input", "dropdown"]

  connect(){
   console.log('Connected')
   this.loadTags()
  }

  loadTags() {
    // Fetch tags from database and update the dropdown
    console.log('loading tags')
    const query = this.inputTarget.value
    if (query && query.length > 2) {
       console.log('fetching resources')
       fetch('http://localhost:3000/search_tag?query=' + encodeURIComponent(query))
         .then(response => response.json())
         .then(tags => this.updateDropdown(tags))
    }

 }

  updateDropdown(tags) {
    // Update the dropdown menu with the fetched tags
    const dropdown = this.dropdownTarget
    dropdown.innerHTML = ''
    tags.forEach(tag => {
       const option = document.createElement('option')
       option.value = tag.id
       option.textContent = tag.name
       dropdown.appendChild(option)
    })    
 }

}
