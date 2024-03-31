import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

// Connects to data-controller="maintain-rooms"
export default class extends Controller {
  static targets = ["messages"]

  connect() {
    console.log('message live feed online')
    this.subscribeToMessageChannel()
  }

  disconnect() {
    console.log('message live feed offline')
    this.unsubscribeFromMessageChannel()
  }

  subscribeToMessageChannel() {
    const room_id = this.data.get("room-id")
    this.messages_subcription = consumer.subscriptions.create({ channel: "MessageChannel", room_id: room_id }, {
    received(data) {
      // Handle incoming room messages
      messageElement = document.createElement("div")
      messageElement.classList.add("chat-message")
      messageElement.innerHTML = `
        <strong>${data.username}:</strong> ${data.body}
      `        
      this.messagesTarget.appendChild(messageElement)
    }
  })
  }

  unsubscribeFromMessageChannel() {
    console.log(this.messages_subcription)
    if (this.messages_subcription) {
      this.messages_subcription.unsubscribe()
    }
  }  

}
