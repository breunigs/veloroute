#!/usr/bin/env ruby

Dir.chdir(File.dirname(__FILE__) + "/../routes")

require_relative Dir.pwd+"/rss"
require "twitter"
require "open-uri"
require "pry"
require 'open3'

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

def find(lonLat)
  x = `../tools/coord_to_suburb.rb #{lonLat[1]} #{lonLat[0]}`
  return nil if $?.exitstatus != 0
  x.strip
end

def direct_run(command, pipe = nil)
  raise "must be an array" unless command.is_a?(Array)
  exit_status = -1
  str_out = []
  str_err = []
  output = ''
  Open3.popen3(*command) do |stdin, stdout, stderr, wait_thr|
    # wait_thr.pid # pid of the started process.
    stdin.write(pipe) if pipe
    stdin.close
    exit_status = wait_thr.value # Process::Status object returned.
    str_out << stdout.read
    str_err << stderr.read
    output << str_out.last
    output << str_err.last
  end

  return exit_status == 0, output, str_out.join, str_err.join
end

posts.each do |post|
  loc = find(post[:lonLat])

  tweet = " "
  tweet << "#" << loc << " " if loc
  tweet << post[:link].to_s
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

  subject = post[:title]
  subject += " (#{loc})" if loc

  ENV["EMAILS"].split(/\s+/).each do |email|
    body = <<~BODY
      <strong>#{subject}</strong><br><br>

      <a href="#{post[:link]}">Ansicht auf veloroute.hamburg</a><br><br>

      #{post[:description].gsub("<img ", '<img width="300" style="margin:1em;max-width:80%;max-height:80%;width:auto" ')}<br><br>

      Dein veloroute.hamburg
    BODY

    ok, stdout, stdin = direct_run(["/usr/bin/s-nail",
      # "-d",
      "-s", "veloroute.hamburg: #{subject}",
      "-r", "stefan-veloroute@breunig.xyz",
      "-b", "stefan-bcc@yrden.de",
      "-M", 'text/html',
      email],
      body)

    if !ok
      puts "Failed to send email for #{email}"
      binding.pry
    end
  end
end



