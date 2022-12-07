class UserMailer < ApplicationMailer
  def status_update
    @user = params[:user]
    @reservation = params[:reservation]
    attachments.inline["tmp/qr_code.png"] = File.read("#{Rails.root}/tmp/qr_code.png")
    mail(to: @user.email, subject: "Reservation update: order number #{@reservation.id}")
  end
end
