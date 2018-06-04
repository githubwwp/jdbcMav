Ext.onReady(function() {
    var panel = Ext.create('Ext.panel.Panel', {
        tbar : [ {
            xtype : 'button',
            text : 'local combo',
            handler : showLocalCombo
        } ],
    });

    Ext.create('Ext.container.Viewport', {
        layout : 'fit',
        items : [ panel ]
    });

    // TODO
    showLocalCombo();
});

function showLocalCombo() {
    var form = Ext.create('Ext.form.Panel', {
       layout: 'column',
       
    });
    var combo = Ext.create('Ext.form.field.ComboBox', {
        fieldLabel: 'select a single state',
        displayField: 'name',
        quertMode: 'local',
        
        
    });

    Ext.create('Ext.window.Window', {
        autoShow : true,
        title : 'local combo form',
        width : 500,
        height : 400,
        modal : true,
        layout : 'fit',
        items : [ combo ]
    });
}
