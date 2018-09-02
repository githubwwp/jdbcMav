Ext.onReady(function() {
	var panel = Ext.create('Ext.Panel', {
		width : 500,
		height : 400,
		title : "AnchorLayout Panel",
		layout : 'anchor',
		items : [ {
			xtype : 'panel',
			title : '75% Width and 20% Height',
			anchor : '75% 20%'
		}, {
			xtype : 'panel',
			title : 'Offset -300 Width & -200 Height',
			anchor : '-300 -200'
		}, {
			xtype : 'panel',
			title : 'Mixed Offset and Percent',
			anchor : '-250 20%'
		} ]
	});
	
	Ext.create('Ext.container.Viewport', {
		layout : {
			align: 'middle',
			type : 'hbox',
			pack: 'center'
		},
		items : panel
	});
});