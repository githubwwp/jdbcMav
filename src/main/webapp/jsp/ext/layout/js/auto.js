Ext.onReady(function() {
	Ext.create('Ext.Panel', {
		width : 500,
		height : 280,
		autoScroll : true,
		resizable : true,
		title : "AutoLayout Panel",
		layout : {
			type : 'auto',
			width : '100%'
		},
		renderTo : document.body,
		items : [ {
			xtype : 'panel',
			title : 'Top Inner Panel',
			closable : true,
			height : 90
		}, {
			xtype : 'panel',
			title : 'Bottom Inner Panel',
			width : '75%',
			height : 290
		} ]
	});
});