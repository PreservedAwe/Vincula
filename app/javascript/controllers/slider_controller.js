import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {
  static targets = ["input", "value"];

  connect() {
    this.updateValue();
  }

  updateValue() {
    const value = this.inputTarget.value;
    this.valueTarget.textContent = value;
  }
}
