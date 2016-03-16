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
	orders_input = params[:orders]
	@orders = parse_order_line orders_input
	erb :cart
end


def parse_order_line orders_input
	# данные о заказе прилитают сюда в виде: product_1=4,product_2=8,product_3=3,
	s1 = orders_input.split(',')
	# получаем массив с product_1=4
	arr = []
	s1.each do |x|
		s2 = x.split('=')
		s3 = s2[0].split('_')
		prod_id = s3[1]
		#o = Product.find(prod_id)
		amount = s2[1]
		arr2 = [prod_id, amount]
		arr.push arr2
	end
	return arr
end