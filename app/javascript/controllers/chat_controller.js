import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["conversation", "fontawesome"]

  show() {
    this.conversationTarget.style.display = "block"
  }

  hide() {
    this.conversationTarget.style.display = "none"
  }
}
