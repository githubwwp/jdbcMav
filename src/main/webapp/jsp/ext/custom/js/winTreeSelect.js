
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
                xtype: 'dcmsperson2', 
                store : sexStore, queryMode : 'local', displayField : 'text', valueField : 'value', forceSelection : true
            }
            
        ],
        renderTo: Ext.getBody()
    });
    
    var win = Ext.create('Ext.window.Window', {
        title : '二次入职临时登记', width : 550, height : 450,
        autoScroll: true, closable : true, frame : true, constrainHeader : true, modal: true,
        layout : 'anchor',
        items : [ 
             {
                xtype: 'winTreeSelect', 
                store : sexStore, queryMode : 'local', displayField : 'text', valueField : 'value', forceSelection : true
            }   
        ],
        buttonAlign : 'center',
        fbar : [ 
            {   text : '保存',
            },
            {   text : '取消',
                handler : function(btn, e) {
                    btn.findParentByType('window').close();
                }
            }
        ],
        listeners : {}
    });
//    win.show();
    
});