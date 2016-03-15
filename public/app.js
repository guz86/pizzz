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
}

// считаем именно количество товаров по "product_" в корзине через функцию
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