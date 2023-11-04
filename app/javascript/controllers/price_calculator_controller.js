import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['price', 'startTime', 'endTime'];

  connect() {
    this.updatePrice();
  }

  updatePrice() {
    const startTimeValue = this.startTimeTarget.value;
    const endTimeValue = this.endTimeTarget.value;

    const pricePerDay = parseFloat(this.priceTarget.dataset.dailyPrice);
    if (startTimeValue && endTimeValue) {
      const startTime = new Date(startTimeValue);
      const endTime = new Date(endTimeValue);

      const days = (endTime - startTime) / (24 * 60 * 60 * 1000);
      const totalPrice = pricePerDay * days;

      this.priceTarget.textContent = `Total: $${totalPrice.toFixed(2)}`;
    } else {
      this.priceTarget.textContent = `Total: $${pricePerDay.toFixed(2)}`;
    }
  }
}
