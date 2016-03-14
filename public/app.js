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

// считаем количество товаров в корзине
var items = 0;

for(var i in localStorage)
{
	localStorage[i]
	items = items * 1 + localStorage[i] * 1
}

    console.log(items);

}