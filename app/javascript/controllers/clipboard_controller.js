import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  copy(event) {
    const codeEl = event.target
      .closest(".code-block")
      .querySelector("pre code");
    const text = codeEl.innerText;

    navigator.clipboard.writeText(text).then(() => {
      event.target.textContent = "Copied!";
      setTimeout(() => (event.target.textContent = "Copy"), 1500);
    });
  }
}
