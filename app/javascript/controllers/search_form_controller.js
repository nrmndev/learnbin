import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["scopeSelect", "queryInput"];

  connect() {
    // optionally initialize form action
    console.log(this.scopeSelectTarget);
    console.log(this.queryInputTarget);

    //this.updateFormAction();
  }

  onScopeChange(event) {
    this.updateFormAction();
  }

  submit(event) {
    // Before the form is submitted, make sure the action is correct
    this.updateFormAction();
    // Continue with submission (no event.preventDefault())
  }

  updateFormAction() {
    const scope = this.scopeSelectTarget.value;
    const query = this.queryInputTarget.value.trim();

    if (scope === "user" && query !== "") {
      // go to /:username
      this.element.action = `/${encodeURIComponent(query)}`;
    } else if (scope === "topic" && query !== "") {
      // go to /topic?q=...
      this.element.action = "/topic";
      // For GET method, the query param will attach automatically, e.g. ?q=...
    } else {
      // fallback to root or default
      this.element.action = "/";
    }
  }
}
