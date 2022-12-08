class UserMailer < ApplicationMailer
  def status_update
    @user = params[:user]
    @reservation = params[:reservation]
    if @reservation.status == "Confirmed"
      attachments.inline["tmp/qr_code.png"] = File.read(File.join(Rails.root, "tmp/qr_code.png"))
    end
    mail(to: @user.email, subject: "Reservation update: order number #{@reservation.id}")
  end
end
