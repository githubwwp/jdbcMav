Ext.onReady(function() {
	var panel = Ext.create('Ext.panel.Panel', {
		title : 'Accordion Layout',
		width : 300,
		height : 300,
		multi : true,
		defaults : {
			// applied to each contained panel
			bodyStyle : 'padding:15px'
		},
		// Note: Only Ext Panels and all subclasses of Ext.panel.Panel may be
		// used in an accordion layout Container.
		layout : {
			// layout-specific configs go here
			type : 'accordion',
			titleCollapse : false,
			animate : true,
			multi : true,
			activeOnTop : true
		},
		items : [ {
			title : 'Panel 1',
			html : 'Panel content!'
		}, {
			title : 'Panel 2',
			html : 'Panel content!'
		}, {
			title : 'Panel 3',
			html : 'Panel content!'
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