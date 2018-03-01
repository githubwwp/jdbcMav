
Ext.onReady(function(){
    
    var sexStore = Ext.create('Ext.data.Store', {
        fields: ['text', 'value'],
        data : [
            {value: '男', text: '男'},
            {value: '女', text: '女'}
        ]
    });
    
    Ext.create('Ext.panel.Panel', {
        title: 'auto Layout',
        width: 300,
        height: 300,
        defaults: {
            // applied to each contained panel
            bodyStyle: 'padding:15px'
        },
        items: [
            {
               xtype: 'textfield', fieldLabel: 'abc' 
            },
            {
                xtype: 'winTreeSelect', 
                store : sexStore, queryMode : 'local', displayField : 'text', valueField : 'value', forceSelection : true
            }
            
        ],
        renderTo: Ext.getBody()
    });
});