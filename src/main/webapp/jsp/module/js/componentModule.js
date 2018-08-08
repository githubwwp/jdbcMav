Ext.onReady(function() {

    var comp = Ext.create('Ext.Component', {
        height : 200,
        width : 300,

        border : 5,
        tpl: 'this is a tpl',
        style : {
        },
        html : '<h2>this is a sub title</h2>',
        contentEl: 'abc',
        items : [ {
            xtype : 'button',
            text : 'as'
        }, {} ]
    });

    Ext.create('Ext.container.Viewport', {
        layout : 'anchor',
        items : [ comp ]
    });
});