class FacebookBot

  def send_message(data)
    url = URI.parse("https://graph.facebook.com/v2.6/me/messages?access_token=#{ENV['ACCESS_TOKEN']}")

    http = Net::HTTP.new(url.host, 443)
    http.use_ssl = true
    begin
      request = Net::HTTP::Post.new(url.request_uri)
      request["Content-Type"] = "application/json"
      request.body = data.to_json
      response = http.request(request)
      body = JSON(response.body)
      return { ret: body["error"].nil?, body: body }
    rescue => e
      raise e
    end
  end

  def send_text_message(sender, text)
    data = {
      recipient: { id: sender },
      message: { text: text }
    }
    send_message(data)
  end

  def send_generic_message(sender, data)
    data = {
      recipient: { id: sender },
      message: data
    }
    send_message(data)
  end
end
