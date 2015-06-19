class ProductsController < ApplicationController
  before_filter :authenticate_user!

  def buy
    sms_sender = "+#{current_user.country_code}#{current_user.phone_number}"

    begin
      TWILIO_CLIENT.messages.create(
        to: sms_sender,
        from: "+19253266669",
        body: "You just purchased a #{params[:product]} at Rails Girls Demo. :-)"
      )

      flash[:notice] = "The product was bought successfully."

    rescue Exception => e
      logger.error "Error sending the SMS to user #{current_user.id} #{e.message}"
      flash[:error] = "Error sending the confirmation SMS"
    end

    redirect_to root_path
  end
end
