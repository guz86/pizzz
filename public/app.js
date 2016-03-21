//function something()
//{
//	var x = window.localStorage.getItem('aaa');
//	x = x * 1 + 1;
//	window.localStorage.setItem('aaa', x);
//	alert(x);
//}

function add_to_cart(id)
{
	var key = 'product_' + id;

	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;
	window.localStorage.setItem(key, x);

	// alert ('Items in your cart:  ' + cart_get_item())
	update_orders_input();
	update_orders_button();
}

// нужно добавлять значения в форму, и при добавлении новых заказов
function update_orders_input()
{
	var orders = cart_get_orders();
	$('#orders_input').val(orders);
}

// Отображение данных в кнопке на странице о заказе для пользователя
function update_orders_button()
{
	var text = 'Cart (' + cart_get_item() + ')';
		$('#orders_button').val(text);	
}

// считаем именно количество товаров по "product_" в корзине через функцию - будем отображать в кнопке
function cart_get_item()
{
	var cnt = 0;

	for(var i = 0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i); // ключ
		 var value = window.localStorage.getItem(key); // значение по ключу

		if(key.indexOf('product_') == 0)
		{
			cnt = cnt + value*1;
		}
	}
    return cnt;
}



// делаем строчку с заказом
function cart_get_orders()
{
	var orders = '';

	for(var i = 0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i); // ключ
		 var value = window.localStorage.getItem(key); // значение по ключу

		if(key.indexOf('product_') == 0)
		{
			orders = orders + key + '=' + value + ',';
		}
	}
    return orders;
    // возвращает product_1=1,product_3=2,
}


function cancel_order()
{
	// очистка localStorage и неотправка формы, вызывается через return
	window.localStorage.clear();
	// обновляем состояние кнопки
	update_orders_input();
	update_orders_button();
	// через plnkr.co подключили jQuery для замены содержимого div
	$('#cart').text('Your cart in now empty!')
	return false;
}