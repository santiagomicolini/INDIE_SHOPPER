import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="collapsable-cards"
export default class extends Controller {
  static targets = ["cards"]
  connect() {
    // console.log("hello")
    // console.log(this.cardsTarget)
    // console.log(this.cardsTarget)
  }


    toggle(event) {
      let button_id = event.currentTarget.dataset.reservation
      let card_id = this.cardsTarget.dataset.cards
      let current_card = this.cardsTargets.find(card => card.dataset.cards == button_id)
      current_card.classList.toggle("hidden")
    }
    }
