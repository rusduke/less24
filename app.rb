#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>!!!"			
end

get '/about' do
	@error = 'something'
	erb :about
end

get '/err' do
	erb :err
end

get '/visit' do
	erb :visit
end

post '/visit' do
	erb :visit
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	hh = {:username => 'Введите имя', 
		  :phone => 'Введите телефон', 
		  :datetime => 'Введите дату'}
#	hh.each do |key, value|
#		if params[key] == ''
#			@error = hh[key]
#			return erb :visit
#		end
#	end
	@error = hh.select {|key,_| params[key] == ""}.values.join(", ")
	if @error != ''
		return erb :visit
	end



	f = File.open './public/users.txt','a'
	f.write "User: #{@username}, phone #{@phone}, date & time #{@datetime}, #{@barber}, #{@color}\n"
	#erb :visit
	erb "User: #{@username}, phone #{@phone}, date & time #{@datetime}, #{@barber}, #{@color}\n"

	

end 

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	erb :contacts
	@email = params[:email]
	@message = params[:message]
	flag = @email.include? "@"
	if flag == true 
		f1 = File.open './public/contacts.txt','a'
		f1.write "E-mail: #{@email}, Text #{@message}\n"
	end
	erb :contacts
end 

