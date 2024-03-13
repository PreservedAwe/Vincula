import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="artist-search"
export default class extends Controller {

  static targets = ["input", "dropdown"]

  connect(){
   console.log('Connected')
   this.loadArtists()
  }

  loadArtists() {
    // Fetch artists from Spotify API and update the dropdown
    console.log('loading artists')
    const query = this.inputTarget.value
    if (query && query.length > 2) {
       console.log('fetching resources')
       fetch(`http://localhost:3000/search_artist?query=${query}`)
         .then(response => response.json())
         .then(artists => this.updateDropdown(artists))
    }

 }

  updateDropdown(artists) {
    // Update the dropdown menu with the fetched artists
    const dropdown = this.dropdownTarget
    dropdown.innerHTML = ''
    artists.forEach(artist => {
       const option = document.createElement('option')
       option.value = artist.id
       option.textContent = artist.name
       dropdown.appendChild(option)
    })    
 }

}
