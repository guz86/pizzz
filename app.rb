#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

get '/' do
	@products = Product.all
	erb :index		
end

get '/about' do
	erb :about		
end

get '/place-order' do
	@ord = Order.new
	erb :place_order 
end

get '/day_order' do
	@orders_today = Order.all
	erb :day_order 
end

post '/place-order' do
	@ord = Order.create params[:order]
	erb :order_placed
end

post '/cart' do
	# достаем значения из name из layout
	@orders_input = params[:orders_input]
	@items = parse_orders_input @orders_input 

	# Если корзина пуста, выводить страницу что заказа нет
	if @items.length == 0
		return erb :cart_is_empty
	end
	# выводим список продуктов
	# заменяем id на данные о пицце
	@items.each do |item|
		# id, cnt
		#@post = Post.find(params[:id])
		item[0] = Product.find(item[0])
	end

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

def parse_orders_input orders_input
	# данные о заказе прилитают сюда в виде: product_1=4,product_2=8,product_3=3,
	s1 = orders_input.split(',')
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