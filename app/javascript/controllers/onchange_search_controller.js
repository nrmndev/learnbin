import { Controller } from "@hotwired/stimulus";

// optional: if you want to use a debounce utility
function debounce(fn, delay) {
  let timeoutId;
  return function (...args) {
    if (timeoutId) clearTimeout(timeoutId);
    timeoutId = setTimeout(() => {
      fn.apply(this, args);
    }, delay);
  };
}

export default class extends Controller {
  static values = {
    delay: { type: Number, default: 300 }, // milliseconds
  };

  connect() {
    console.log("Connected");

    // create a debounced version of submit so it's not firing too quickly
    this.debouncedSubmit = debounce(this.submit.bind(this), this.delayValue);
  }

  // this method will be called by input or change events
  inputOrChange(event) {
    // optional: you can check event.target.value, maybe skip if blank, etc.
    this.submit();
    //this.debouncedSubmit();
  }

  // method to actually submit
  submit() {
    // Use requestSubmit, which fires the native submit event
    this.element.requestSubmit();
  }
}
