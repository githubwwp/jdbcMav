Ext.onReady(function(){
    
    Ext.create('Ext.container.Viewport', {
        layout: 'anchor', 
        items: [
            {
                xtype: 'button',
                text: 'loadStore',
                handler: loadStore
            }
        ]
    });
    
});

function loadStore(){
    var store = Ext.create('Ext.data.Store', {
        fields: ['a', 'b', 'c'],
        proxy: {
            type: 'ajax',
            url: contextPath+ "/storeTest/getAbcStore.do",
            params: {
            },
            reader: {
                root: 'userTestVos'
            }
        }
    });
    console.log(store);
    store.load();
    console.log(store);
}