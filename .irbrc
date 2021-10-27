#File.open('/myapp/delete_me.txt', 'w') do |file|
#  file.puts caller.inspect
#end

require 'irb/completion' # tab completion

unless ENV['SKIP_CUSTOM_IRBRC'] =~ /true|yes/i
  IRB.conf[:SAVE_HISTORY]=100
  IRB.conf[:HISTORY_FILE]="#{ENV["HOME"]}/.irb_history"
  IRB.conf[:PROMPT][:SIMPLE] = {
    :PROMPT_I => "\e[31m>>\e[m ",
    :PROMPT_S => "-> ",
    :PROMPT_C => "*> ",
    :RETURN   => "\e[36m=>\e[m %s\n"
  }
  IRB.conf[:PROMPT_MODE]=:SIMPLE
  IRB.conf[:AUTO_INDENT]=true

  require 'rubygems'
  require 'awesome_print'
  AwesomePrint.irb! # comment-out this line to skip colorized/formatted output
  puts "NOTE: to skip project custom .irbrc config set SKIP_CUSTOM_IRBRC env var to \"true\""
else
  puts "NOTE: skipping project custom .irbrc config because SKIP_CUSTOM_IRBRC env var is #{ENV['SKIP_CUSTOM_IRBRC'].inspect}"
end

puts "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL} (#{RUBY_RELEASE_DATE}) #{RUBY_PLATFORM}\n\n"

puts "\nInstantiating and configuring '@core_api' and '@legacy_credentials' variables"
puts "using the ENV vars in the .env file (passed through docker-compose.yml)."
puts "Alternatively, these vars can be assigned by sourcing the .env file into"
puts "the current shell with '. ./.env'.\n\n"

puts "\e[33m@core_api = WebstopApi::Client.new\e[0m\n\n"
puts "\e[33m@legacy_admin = @core_api.legacy_login(
    retailer_id: #{ENV['WEBSTOP_API_RETAILER_ID']},
    type: '#{ENV['WEBSTOP_API_AUTH_TYPE']}',
    login: '#{ENV['WEBSTOP_API_AUTH_LOGIN']}',
    password: '#{ENV['WEBSTOP_API_AUTH_PASSWORD']}'
)\e[0m\n\n"
puts "\e[33m@legacy_credentials = @legacy_admin.api_user_credentials\e[0m\n\n"

@core_api = WebstopApi::Client.new
@legacy_credentials = nil
begin
  @legacy_admin = @core_api.legacy_login(
    retailer_id: ENV['WEBSTOP_API_RETAILER_ID'],
    type: ENV['WEBSTOP_API_AUTH_TYPE'],
    login: ENV['WEBSTOP_API_AUTH_LOGIN'],
    password: ENV['WEBSTOP_API_AUTH_PASSWORD']
  )
  @legacy_credentials = @legacy_admin.api_user_credentials
rescue => e
  puts "WARNING: @legacy_credentials - failed trying to login:\n  #{e.message}\n\n"
end

puts "\e[33m@admin = @core_api.login(
    consumer_session: {
      email: #{ENV['WEBSTOP_API_AUTH_LOGIN']},
      password: #{ENV['WEBSTOP_API_AUTH_PASSWORD']},
      retailer_id: #{ENV['WEBSTOP_API_RETAILER_ID']}
    }
  )
  @credentials = @admin.consumer_credentials\e[0m\n\n"

@credentials = nil
begin
  @admin = @core_api.login(
    consumer_session: {
      email: ENV['WEBSTOP_API_AUTH_LOGIN'],
      password: ENV['WEBSTOP_API_AUTH_PASSWORD'],
      retailer_id: ENV['WEBSTOP_API_RETAILER_ID']
    }
  )
  @credentials = @admin.consumer_credentials
rescue => e
  puts "WARNING: @credentials - failed trying to login:\n  #{e.message}\n\n"
end

puts "Note that most \e[33m@core_api\e[0m methods require \e[33m@legacy_credentials\e[0m"
puts "or \e[33m@credentials\e[0m to be passed for authentication.\n\n"
puts "Example 1:"
puts "\e[33m@offers = @core_api.search_coupons(
    {
        tag: \"enroll-erie\",
        scopes: [\"from_inmar\", \"future_display_end_date\"]
    },
    @legacy_credentials
)\e[0m\n\n"

puts "Example 2:"
puts "\e[33m@consumer = @core_api.get_consumer(241940, @credentials)\e[0m\n\n"
