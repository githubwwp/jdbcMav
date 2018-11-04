Ext.onReady(function() {
	
//	var o = {'name': '张三', age: 23, sex: 'men'};
	
//	var r = Ext.Object.chain(o);
//	
//	Ext.Object.each(o, function(prop, val){
//		console.log(prop, ': ', val)
//	
//	});
		
	// 3: fromQueryString
//	var str = 'name=bjsxt&age=10';
//	var obj = Ext.Object.fromQueryString(str);
//	console.log(typeof Ext.encode(obj));
//	console.log('getSize(): ', Ext.Object.getSize(obj));
	
	
	//4 toQueryObjects
//	console.log(Ext.Object.toQueryObjects('a', o, true));
	
	//5 fromQueryString
//	console.log(Ext.Object.toQueryString(o));	

/* Number 方法 */
	// constrain
//	var n = Ext.Number.constrain(5, 1, 20);
//	console.log(n);
	
	// randomInt
//	var n = Ext.Number.randomInt(1, 10);
//	console.log(n);

	// toFixed
//	var n = Ext.Number.toFixed(undefined, 2);
//	console.log(n);
	
/* Ext.String */
//	var s = Ext.String.capitalize('bjsxt');
//	var s = Ext.String.ellipsis('www.wwp123.top',18);
//	Ext.String.trim('  abc  ');
	
/* Ext.Array */
//	var a = Ext.Array.clean([1, 3, null, '', undefined, [], 4 ]);
//	Ext.Array.each(['a', 'b', 3], function(v, i){
//		console.log(i, ': ', v);
//		if('b' == v){
//			return false;
//		}
//	});
	
//	var arr = [1, 2, 3, 4, 5, 18, 23];
//	var na = Ext.Array.filter(arr, function(item){
//		if(item> 10){
//			return false
//		}else{
//			return true;
//		}
//	});


/* Ext.Date */	
var b = Ext.Date.between(new Date(), new Date(2013, 03, 03), new Date(2019, 01, 01));
console.log(b);

});

Ext.require


