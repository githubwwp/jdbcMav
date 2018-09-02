Ext.onReady(function(){
    var panel = Ext.create('Ext.Panel', {
        width: 500,
        height: 400,
        title: "VBoxLayout Panel",
        layout: {
            type: 'vbox',
            align: 'stretch'
        },
        items: [{
            xtype: 'textfield',
            labelField: 'textfield',
            title: 'adbc',
            width: 50,
            height: 50
        },
        {
            xtype: 'panel',
            title: 'Inner Panel Two',
            width: 200,
            flex: 4
        },
        {
            xtype: 'panel',
            title: 'Inner Panel Three',
            width: '50%',
            flex: 4
        }]
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