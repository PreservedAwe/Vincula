import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

// Connects to data-controller="maintain-rooms"
export default class extends Controller {
  connect() {
    console.log('room live feed online')
    this.subscribeToRoomChannel()
  }

  disconnect() {
    console.log('room live feed offline')
    this.unsubscribeFromRoomChannel()
  }

  subscribeToRoomChannel() {
    const user_username = this.data.get("user-username")
    this.rooms_subscription = consumer.subscriptions.create({ channel: "RoomChannel", username: user_username }, {
    received(data) {
      // Handle incoming room messages
    }
  })
  }

  unsubscribeFromRoomChannel() {
    console.log(this.rooms_subscription)
    if (this.rooms_subscription) {
      this.rooms_subscription.unsubscribe()
    }
  }    
}
