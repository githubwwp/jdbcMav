Ext.onReady(function() {
	
	new Ext.Viewport({
		layout: 'fit',
		items: [
			{
				title: 'panel',
				id: 'pa'
			}
		]
	});
	
	
//	var arr = [1, 2, 3, 4, 5];
//	Ext.each(arr, function(a, i){
//		console.log("a: ", a, "i: " , i, "arr: " , arr);
//	});
//	
//	Ext.select("div").each(function(e){
//		console.log(e.dom);
//	});
//	
//	
//	console.log("-----------------")
//	
//	Ext.each(Ext.query("div"), function(e){
//		console.log(e);
//	});
//	
//	console.log("-----------------")
//	
//	console.log(Ext.query("div#hello1"));
	
	console.log(Ext.getCmp("pa"));
	
});