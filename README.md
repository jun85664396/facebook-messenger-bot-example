#facebook-messenger-bot

A Ruby on Rails example  for the Facebook Messenger Platform(Bot).

Requires Rails >= 4.2.0

##Installation
  
    git clone https://github.com/jun85664396/facebook-messenger-bot
    bundle install


##initialization

    vim .env
      ACCESS_TOKEN=<ACCESS_TOKEN>
      VERIFY_TOKEN=<VERIFY_TOKEN>
      
##Usage

![Example](https://i.imgur.com/YTMOYg6.gif)


  
    15         text = event["message"]["text"]
               # Handle a text message from this sender
    16         res = FacebookBot.new.send_text_message(sender, "reply: #{text}")
    17         # res = FacebookBot.new.send_generic_message(sender)
    18         # { ret: true or false, body: response_body }

generic example : https://developers.facebook.com/docs/messenger-platform/send-api-reference#examples
