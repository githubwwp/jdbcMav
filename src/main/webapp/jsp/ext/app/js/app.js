Ext.onReady(function() {
    Ext.create('Ext.container.Viewport', {
        layout: 'border',
        
        items : [ {
            xtype : 'button',
            text : 'test btn',
            scale : 'large',
            menu : [ {
                text : 'item 1'
            } ]
        }, {
            xtype : 'panel',
            title : 'panel' + Math.random(),
            height : 120
        }, {
            xtype : 'panel',
            title : 'panel' + Math.random(),
            height : 120
        }, {
            xtype : 'panel',
            title : 'panel' + Math.random(),
            height : 120
        }, {
            xtype : 'panel',
            title : 'panel' + Math.random(),
            height : 120
        } ]
    });
});
