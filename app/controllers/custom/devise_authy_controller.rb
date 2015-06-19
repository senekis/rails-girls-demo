class Custom::DeviseAuthyController < Devise::DeviseAuthyController
  def POST_enable_authy
    resource.country_code = params[:country_code]
    resource.phone_number = params[:cellphone]

    super
  end
end
