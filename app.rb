#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

get '/' do
	@products = Product.all
	erb :index		
end

get '/about' do
	erb :about		
end

post '/cart' do
	# достаем значения из name из layout
	orders_line = params[:orders]
	@orders = parse_orders_input orders_line
	erb :cart
end

# cart_get_orders() возвращает product_1=4,product_2=8,product_3=3,
#orders = "product_1=4,product_2=8,product_3=3,"
#s1 = orders.split(/,/)
#puts s1.inspect
#s1.each do |x|
#	s2 = x.split('=')
#	s3 = s2[0].split('_')
#	key = s3[1]
#	value = s2[1]
#	puts "Product id #{key}, number of items: #{value}"
#end

# для этого используют json а так мартышкин труд

def parse_orders_input orders_line
	# данные о заказе прилитают сюда в виде: product_1=4,product_2=8,product_3=3,
	s1 = orders_line.split(',')
	# получаем массив с product_1=4
	arr = []
	s1.each do |x|
		s2 = x.split('=')
		s3 = s2[0].split('_')
		id = s3[1]
		#o = Product.find(id)
		cnt = s2[1]
		arr2 = [id, cnt]
		arr.push arr2
	end
	return arr
end