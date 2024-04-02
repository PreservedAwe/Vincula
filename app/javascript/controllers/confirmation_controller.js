import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="confirmation"
export default class extends Controller {
  promptUser(event) {
    const confirmed = confirm("Are you sure?")

    if (!confirmed) {
      event.preventDefault()
    }
 }
}
