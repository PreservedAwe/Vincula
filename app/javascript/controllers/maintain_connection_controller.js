import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

// Connects to data-controller="maintain-connection"
export default class extends Controller {
  connect() {
    this.checkConnection();
  }

  checkConnection() {
    // Check connection status immediately
    console.log("Initial connection status:", consumer.connection.connected);

    // Wait for connection to be established before starting the interval
    consumer.connection.onopen = () => {
      setInterval(() => {
        console.log("Connection status:", consumer.connection.connected);
        if (!consumer.connection.connected) {
          consumer.connection.reopen();
        }
      }, 5000); // Check every 5 seconds
    };
  }
}
