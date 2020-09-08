require 'twitter'
require 'yaml'

client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

tweets = client.user_timeline('rubyinside', count: 20)
tweets.each { |tweet| puts tweet.full_text }
File.write('tweets.yml', YAML.dump(tweets))

