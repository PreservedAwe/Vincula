import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

// Connects to data-controller="maintain-rooms"
export default class extends Controller {
  connect() {
    this.subscribeToMessageChannel()
  }

  subscribeToMessageChannel() {
    const room_id = this.data.get("room-id");
    const messages_subcription = consumer.subscriptions.create({ channel: "MessageChannel", room_id: room_id }, {
      received(data) {
        // Handle incoming room messages
      }
    });
  }
}
