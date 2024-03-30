import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="maintain-connection"
export default class extends Controller {
  connect() {
    this.checkConnection();
  }

  checkConnection() {
    setInterval(() => {
      if (!ActionCable.connection.isConnected()) {
        ActionCable.connection.reopen();
      }
    }, 5000); // Check every 5 seconds
  }
}
