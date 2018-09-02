Ext.onReady(function() {
	var panel = Ext.create('Ext.panel.Panel', {
		title : 'Fit Layout',
		width : 300,
		height : 150,
		layout : 'fit',
		items : {
			title : 'Inner Panel',
			html : 'This is the inner panel content',
			bodyPadding : 20,
			border : false
		}
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