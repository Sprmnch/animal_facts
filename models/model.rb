require 'open-uri'
require 'json'
require 'pry'
require 'giphy'
require 'net/http'
require 'twilio-ruby'



def get_fact
  cat_url = "http://catfacts-api.appspot.com/api/facts?number=1"
  fact_json = Net::HTTP.get_response(URI.parse(cat_url))
  fact_buffer = fact_json.body
  fact_result = JSON.parse(fact_buffer)
  fact = fact_result["facts"][0]
  url = "http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC"
  resp = Net::HTTP.get_response(URI.parse(url))
  buffer = resp.body
  result = JSON.parse(buffer)
  random_number = rand(25)
  gif_link = result["data"][random_number]["images"]["original"]["url"]
  final_result = [gif_link, fact]
end
  
def send_message(number, fact)
  account_sid = "ACed3ed813257f8acedfce46a695216257"
  auth_token = "cb1dd832eda91ea39319fe6827f1650b"
  @client = Twilio::REST::Client.new account_sid, auth_token
  @client.messages.create(
  from: '+14342605034',
    to: "+#{number}",
  body: "#{fact[1]}",
  media_url: "#{fact[0]}"
)
end
