Ext.onReady(function() {
	var panel = Ext.create('Ext.Panel', {
		width : 500,
		height : 300,
		title : "HBoxLayout Panel",
		layout : {
			type : 'hbox',
			align : 'stretch'
		},
		items : [ {
			xtype : 'panel',
			title : 'Inner Panel One',
			width : 100
		}, {
			xtype : 'panel',
			title : 'Inner Panel Two',
			flex : 1
		}, {
			xtype : 'panel',
			title : 'Inner Panel Three',
			flex : 1
		} ]
	});

	Ext.create('Ext.container.Viewport', {
		layout : {
			align : 'middle',
			type : 'hbox',
			pack : 'center'
		},
		items : panel
	});
});