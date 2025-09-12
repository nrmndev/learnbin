import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("connected");
  }
  toggleModal() {
    const modal = document.getElementById("modal");
    modal.classList.toggle("hidden");
  }
}
