Ext.onReady(function() {

	var panel = Ext.create('Ext.panel.Panel', {
		title : 'abc',
		header: false,
		collapsible : true,
		animCollapse : true,
		collapsed : false,
		hideCollapseTool : false,
		bodyPadding : 10,
		dockedItems : [ {
			xtype : 'toolbar',
			dock : 'bottom',
			items : [ {
				text : 'button'
			} ]
		} ],
		items : [ {
			xtype : 'form',
			width : '100%',
			height : 100
		}, {
			xtype : 'textfield',
			fieldLabel : 'abc'
		} ]
	});

	Ext.create('Ext.container.Viewport', {
		layout : 'fit',
		items : [ panel ]
	});

});
