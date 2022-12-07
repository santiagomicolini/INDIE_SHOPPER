import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["window", "fontawesome"]

  show() {
    this.windowTarget.style.display = "block"
  }

  hide() {
    this.windowTarget.style.display = "none"
    console.log(this.fontawesomeTarget)
  }
}
