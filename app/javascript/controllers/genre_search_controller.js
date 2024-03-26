import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="genre-search"
export default class extends Controller {

  static targets = ["input", "dropdown"]

  connect(){
   console.log('Connected')
   this.loadGenres()
  }

  loadGenres() {
    // Fetch genres from database and update the dropdown
    console.log('loading genres')
    const query = this.inputTarget.value
    if (query && query.length > 2) {
       console.log('fetching resources')
       fetch('http://localhost:3000/search_genre?query=' + encodeURIComponent(query))
         .then(response => response.json())
         .then(genres => this.updateDropdown(genres))
    }

 }

  updateDropdown(genres) {
    // Update the dropdown menu with the fetched genres
    const dropdown = this.dropdownTarget
    dropdown.innerHTML = ''
    genres.forEach(genre => {
       const option = document.createElement('option')
       option.value = genre.id
       option.textContent = genre.name
       dropdown.appendChild(option)
    })    
 }

}
