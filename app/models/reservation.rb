class Reservation < ApplicationRecord
  enum :status, { Pending: 0, Confirmed: 1, Rejected: 2, Collected: 3 }
  belongs_to :shop
  belongs_to :user
  has_many :reservation_products, dependent: :destroy

  # after_update :send_status_update_email, if: :status_changed_to_confirmed?

  # private

  # # method to check if the `status` attribute was changed to 'confirmed'
  # def status_changed_to_confirmed?
  #   status_changed? && status == 'Confirmed'
  # end

  # # method to send email notification
  # def send_status_update_email
  #   # use ActionMailer to send the email
  #   UserMailer.status_update(self).deliver_now
  # end
end
