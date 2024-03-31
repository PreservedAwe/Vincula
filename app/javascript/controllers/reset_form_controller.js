// app/javascript/controllers/clear_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  submit(event) {
     event.preventDefault()
 
     // Extract the CSRF token from the form
     const csrfToken = this.formTarget.querySelector('input[name="authenticity_token"]').value
 
     // Prepare the form data
     const formData = new FormData(this.formTarget)
 
     // Submit the form using AJAX
     fetch(this.formTarget.action, {
       method: "POST",
       headers: {
         "X-CSRF-Token": csrfToken,
         "Content-Type": "application/x-www-form-urlencoded",
       },
       body: new URLSearchParams(formData).toString(),
     })
     .then(response => response.json())
     .then(data => {
     })
     .catch(error => {
       // Handle errors
       console.error('Error:', error)
     })
     this.formTarget.reset()
  }
}
