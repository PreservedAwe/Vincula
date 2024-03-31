import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

// Connects to data-controller="maintain-rooms"
export default class extends Controller {
  connect() {
    this.subscribeToRoomChannel()
  }

  subscribeToRoomChannel() {
    const user_username = this.data.get("user-username");
    const rooms_subscription = consumer.subscriptions.create({ channel: "RoomChannel", username: user_username }, {
      received(data) {
        // Handle incoming room messages
      }
    });
  }
}
