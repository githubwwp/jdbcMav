Ext.onReady(function(){
    // 选项卡
    var gridTabs = Ext.create('Ext.tab.Panel', {
        id: 'gridTabs',
        frame: true, tabPosition: 'bottom'
    });
    
    
    Ext.create('Ext.container.Viewport', {
        layout: 'fit', 
        items: [
            gridTabs
        ]
    });
    
    // examples
    addBaseGrid();
    addEditorGrid();
    
    gridTabs.setActiveTab(1); // 
});


// 基本grid
function addBaseGrid(){
    
  //异步加载store
    var store = new Ext.data.Store({ 
        autoDestroy: true,
        proxy: {
            type: 'ajax',
            url: contextPath + '/gridData/getBaseData.do',//返回的是DataProxy对象 
            reader: {
                type: 'json',
                root: 'items'
            }
        },
        fields:['col1', 'col2', 'col3', 'col4', 'col5'] 
    }); 
    store.load();
    
    // grid
    var baseGrid = Ext.create('Ext.grid.Panel', {
        title: 'baseGrid', id: 'baseGrid',
        selType: 'cellmodel', // 选择单元格而不是行
        store: store, forceFit: true,
        tbar: [
             {   xtype: 'button', text: 'loading',
                handler: function(){
                    Ext.getCmp("baseGrid").getStore().reload();
                }
            }
        ],
        columns: [
            {   header: '第一列', dataIndex: 'col1' },      
            {   header: '第二列', dataIndex: 'col2' },      
            {   header: '第三列', dataIndex: 'col3' },      
            {   header: '第四列', dataIndex: 'col4' },      
            {   header: '第五列', dataIndex: 'col5' }     
        ]
    });
    Ext.getCmp("gridTabs").add(baseGrid);
}

// 有序号的grid
function addSerialGrid(){
    var serialGrid = Ext.create('Ext.grid.Panel', {
        title: 'serialGrid',
        store: Ext.create('Ext.data.Store', {
            fields: ['pf_id', 'fee_owner', 'sale_sum_point', 'allocate_rate', 'sale_person_fee']
        }),
        columns: [
                  
        ]
    });
}

// 可编辑的grid
function addEditorGrid(){
    
  //异步加载store
    var store = new Ext.data.Store({ 
        autoDestroy: true,
        proxy: {
            type: 'ajax',
            url: contextPath + '/gridData/getBaseData.do',//返回的是DataProxy对象 
            reader: {
                type: 'json',
                root: 'items'
            }
        },
        fields:['col1', 'col2', 'col3', 'col4', 'col5'] 
    }); 
    store.load();
    
    var editorGrid = Ext.create('Ext.grid.Panel', {
        title: 'editorGrid', id: 'editorGrid',
        store: store, 
        plugins: [
            Ext.create('Ext.grid.plugin.CellEditing', {
                clicksToEdit: 1
            })
        ],
        tbar: [
             {   xtype: 'button', text: 'loading',
                handler: function(){
                    Ext.getCmp("editorGrid").getStore().reload();
                }
            }
        ],
        columns: [
            {   header: '第一列', dataIndex: 'col1', width: 320,
                editor: {
                    xtype: 'numberfield'
                } 
            },      
            {   header: '第二列', dataIndex: 'col2',width: 320,
                editor: {
                    xtype: 'numberfield'
                }
            },      
            {   header: '第三列', dataIndex: 'col3', width: 320,
                editor: {
                    xtype: 'textfield'
                }
            },      
            {   header: '第四列', dataIndex: 'col4', width: 320,
                editor: {
                    xtype: 'textarea'
                }
            },      
            {   header: '第五列', dataIndex: 'col5', width: 320,
                editor: {
                    xtype: 'datefield'
                }
            }      
        ]
    });
    Ext.getCmp("gridTabs").add(editorGrid);
}

