Ext.onReady(function() {
	
	// 分组测试
	var store = Ext.create("Ext.data.Store", {
		fields: [ 'groupId', 'name', 'age' ],
		groupField: 'groupId',
		data: [
			{ groupId: 'g1', name: 'zdf', age: 23 },
			{ groupId: 'g2', name: 'kpi', age: 87 },
			{ groupId: 'g1', name: 'a1', age: 23 },
			{ groupId: 'g2', name: 'a2', age: 83 },
			{ groupId: 'g1', name: 'a3', age: 34 },
			{ groupId: 'g1', name: 'a4', age: 87 },
			{ groupId: 'g3', name: 'ouwe', age: 76 }
		]
	});
	
	var grid = Ext.create('Ext.grid.Panel', {
		id: 'grid',
		store: store,
		features: [
			{
				ftype: 'grouping',
				groupHeaderTpl: '{columnName}: {name} ({rows.length} Item{[values.rows.length > 1 ? "s" : ""]})'
			}
		],
		columns: [
			{ text: 'name', dataIndex: 'name' },
			{ text: 'age', dataIndex: 'age' }
		]
	});
	
	Ext.create('Ext.container.Viewport', {
		layout: 'fit',
		items: [
			grid
		]
	});
	
});
