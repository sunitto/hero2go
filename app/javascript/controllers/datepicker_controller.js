import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["startDate", "endDate"];
  connect() {
    console.log("Connected to datepicker controller");
    flatpickr(this.startDateTarget, {
    
    });
    flatpickr(this.endDateTarget, {

    });
  }
}
