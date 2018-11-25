Ext.onReady(function() {
	
	
	var data = [
		[ 1, 'zhangsan', 22 ],
		[ 2, 'lisi', 21 ],
		[ 3, 'wangwu', 2 ],
		[ 4, 'zhaoliu', 92 ]
	];
	
	var store = new Ext.data.SimpleStore({
		data: data,
		fields: ['id', 'name', 'age']
	});
	
	var gridPanel = new Ext.grid.Panel({
		id: 'gridPanel',
		title: 'peson info',
		forceFit: true,
		store: store,
		columns: [
			{ header: 'id', dataIndex: 'id'},
			{ header: 'name', dataIndex: 'name'},
			{ header: 'age', dataIndex: 'age'}
		]
	});
	
	new Ext.Viewport({
		title: "abc",
		layout: 'fit',
		items: [
			gridPanel
		]
	});
	
	
});