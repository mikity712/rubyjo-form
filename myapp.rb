require 'rubygems' # この辺を追記
require 'bundler'
Bundler.require
require 'sinatra'
require 'sinatra/reloader'
require 'rest_client'

 
get '/' do
	# "Hello world!"

	@title = "はろーわーるど"
	erb :index

end

get'/about' do
	erb :q
end

post '/check' do
	@email = params[:email]
	@message = params[:message]
	erb :check
end


 post '/send-mail' do
 	@email = params[:email]
	@message = params[:message]
	def send_simple_message
	   RestClient.post "https://api:key-cabe4d08ae4cc3fab6b5946eb54f0123"\
  "@api.mailgun.net/v3/sandboxcebbc7038ab145f1968fcd1e04eb9142.mailgun.org/messages",
      :from => "Excited User <mailgun@sandboxcebbc7038ab145f1968fcd1e04eb9142.mailgun.org>",
	  :to => @email,
	  :subject => "Hello miki",
	  :text => @message
	end
	send_simple_message
	erb :thank
end




# get '/test' do
# 	send_simple_message
# 	erb :thank
# end
# def send_simple_message
# 	 RestClient.post "https://api:key-ほにゃらら"\
# 	 "@api.mailgun.net/v3/sandboxほにゃらら",
# 	 :from => "Mailgun Sandbox <ほにゃらら>",
# 	 :to => "miki<ほにゃらら@ほにゃ>",
# 	 :subject => "Hello miki",
# 	 :text => "こんにちは"
# end


#  post '/send-mail' do
#  	@email = params[:email]
# 	@message = params[:message]
# 	def send_simple_message
# 	  RestClient.post "https://api:key-ほにゃらら"\
# 	  "@api.mailgun.net/v3/sandboxほにゃらら",
# 	  :from => "Mailgun Sandbox <ほにゃらら>",
# 	  :to => "miki<ほにゃらら@ほにゃ>",
# 	  :subject => "Hello miki",
# 	  :text => "こんにちは"
# 	end
# 	send_simple_message
# 	erb :thank
# end


# get'/check' do
# 	erb :check
# end