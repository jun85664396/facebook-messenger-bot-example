class BotController < ApplicationController

  def index
    if params['hub.verify_token'] === ENV['VERIFY_TOKEN']
      return render json: params["hub.challenge"]
    end
    render html: "Error, wrong validation token"
  end

  def webhook
    messaging_events = params["entry"].first["messaging"]
    messaging_events.each_with_index do |event, key|
      sender = event["sender"]["id"]
      unless event["message"].blank? 
        text = event["message"]["text"]
        res = FacebookBot.new.send_text_message(sender, "reply: #{text}")
        #res = FacebookBot.new.send_generic_message(sender)
        # { ret: true or false, body: response_body }
      end
    end
    render html: "", status: 200
  end
end
