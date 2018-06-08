Ext.onReady(function() {
    var panel = Ext.create('Ext.panel.Panel', {
        tbar : [ {
            xtype : 'button',
            text : 'basic toolbar',
            handler : showBasicToolbar
        } ]
    });

    Ext.create('Ext.container.Viewport', {
        layout : 'fit',
        items : [ panel ]
    });

    // TODO
    showBasicToolbar();

});

function showBasicToolbar() {
    var form = Ext.create('Ext.form.Panel', {
        tbar : [ {
            text : 'button w/ menu',
            iconCls : 'bmenu',
            menu : [ {
                xtype : 'combo',
            }, {
                text : 'i hate ext',
                checked : true
            }, '-', {
                text : 'radio options',
                menu : {
                    items : [ '<b>choose a theme</b>', {
                        text : 'aero glass',
                        checked : true,
                        group : 'theme'
                    }, {
                        text : 'vista black',
                        checked : false,
                        group : 'theme'
                    }, {
                        text : 'gray theme',
                        checked : false,
                        group : 'theme'
                    }, {
                        text : 'default theme',
                        checked : false,
                        group : 'theme2'
                    } ]
                }
            } ]
        } ]

    });

    Ext.create('Ext.window.Window', {
        autoShow : true,
        width : 400,
        height : 400,
        title : 'basic toolbar',
        items : [ form ]
    });
}
