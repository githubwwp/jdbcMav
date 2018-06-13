Ext.onReady(function() {
    var panel = Ext.create('Ext.panel.Panel', {
        tbar : [ {
            xtype : 'button',
            text : 'basic toolbar',
            iconCls : 'icon-external-link icon-large icon-color-primary',
            handler : showBasicToolbar
        }, {
            xtype : 'button',
            text : 'overflow toolbar',
            iconCls : 'icon-tasks icon-large icon-color-primary',
            handler : showOverflowToolbar
        }, {
            xtype : 'button',
            text : 'status bar',
            iconCls : 'icon-envelope icon-large icon-color-primary',
            handler : showStatusBar
        } ]
    });

    Ext.create('Ext.container.Viewport', {
        layout : 'fit',
        items : [ panel ]
    });

    // TODO
    showStatusBar();

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
        modal : true,
        items : [ form ]
    });
}

function showOverflowToolbar() {

    var form = Ext.create('Ext.form.Panel', {
        tbar : {
            layout : {
                overflowHandler : 'Menu'
            },
            items : [ {
                xtype : 'splitbutton',
                text : 'munu button',
                menu : [ {
                    text : 'menu item 1'
                } ]
            }, {
                xtype : 'splitbutton',
                text : 'munu button',
                menu : [ {
                    text : 'menu item 2'
                } ]
            }, '-', {
                xtype : 'splitbutton',
                text : 'munu button',
                menu : [ {
                    text : 'menu item 3'
                } ]
            }, {
                xtype : 'splitbutton',
                text : 'munu button',
                menu : [ {
                    text : 'menu item 4'
                } ]
            }, '->', {
                text : 'choose a color',
                menu : [ {
                    xtype : 'colorpicker'
                } ]
            } ]
        }
    });

    Ext.create('Ext.window.Window', {
        autoShow : true,
        width : 200,
        height : 400,
        modal : true,
        title : 'overflow toolbar',
        layout : 'fit',
        items : [ form ]
    });
}

function showStatusBar() {

    var form = Ext.create('Ext.form.Panel', {
        tbar: []
    });

    Ext.create('Ext.window.Window', {
        autoShow : true,
        width : 400,
        height : 400,
        modal : true,
        title : 'status bar',
        layout : 'fit',
        itmes : [ form ]
    });

}
