#!/usr/bin/env ruby

Dir.chdir(File.dirname(__FILE__) + "/../routes")

require_relative Dir.pwd+"/rss"
require "twitter"
require "open-uri"

posts = RSS.list(count: 3).reverse
# ignore posts older than 3 days
posts.reject! { |post| post[:updated] < Time.now - 3*60*60*24 }

exit if posts.none?

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"] or raise "missing CONSUMER_KEY env"
  config.consumer_secret     = ENV["CONSUMER_SECRET"] or raise "missing CONSUMER_SECRET env"
  config.access_token        = ENV["ACCESS_TOKEN"] or raise "missing ACCESS_TOKEN env"
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"] or raise "missing ACCESS_TOKEN_SECRET env"
end

def reject_seen_urls!(posts)
  seen_urls = @client.search("from:VelorouteHH", result_type: "recent").take(10).flat_map do |tweet|
    tweet.urls.map { |uri| uri.expanded_url.to_s }
  end
  posts.reject! { |post| seen_urls.include?(post[:link].to_s) }
end

reject_seen_urls!(posts)
exit if posts.none?

puts "There are #{posts.count} posts that can be tweeted"
puts "Sleeping for a minute to ensure the Twitter API is up to date and we don't"
puts "accidentally double post."

sleep 60
reject_seen_urls!(posts)

posts.each do |post|
  tweet = " " + post[:link].to_s
  tweet = post[:title][0..(280-tweet.size)] + tweet

  puts "Will post:"
  puts
  puts "#{tweet}"
  puts "@ #{post[:lonLat]}"
  puts post[:image]
  puts
  puts

  # rep = ""
  # while rep == ""
  #   sleep 1
  #   puts "Continue? [y/n]"
  #   rep = gets.strip
  # end

  # next if rep != "y"

  @client.update_with_media(
    tweet,
    open(post[:image]),
    long: post[:lonLat][0],
    lat: post[:lonLat][1],
    display_coordinates: true
  )
end



