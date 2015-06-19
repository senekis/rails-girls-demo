account_sid = Rails.application.secrets.twilio_account_sid
auth_token = Rails.application.secrets.twilio_auth_token

# set up a client to talk to the Twilio REST API
TWILIO_CLIENT = Twilio::REST::Client.new account_sid, auth_token