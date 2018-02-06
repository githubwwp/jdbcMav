Ext.onReady(function(){
    // 选项卡
    var treeTabs = Ext.create('Ext.tab.Panel', {
        id: 'treeTabs',
        frame: true, tabPosition: 'bottom',
    });
    
    
    Ext.create('Ext.container.Viewport', {
        layout: 'fit', 
        items: [
            treeTabs
        ]
    });
    
    // examples
    addBaseTree();
    addBaseStoreTree();
    addMultipleColumnsTree();
    
    treeTabs.setActiveTab(0); // 
});

// 多列树
function addMultipleColumnsTree(){
    var tree = Ext.create('Ext.tree.Panel', {
       title: 'multiple columns tree',
       fields: [ 'name', 'description' ],
       columns: [
           {
               xtype: 'treecolunm',
               text: 'name',
               dataIndex: 'name',
               width: 150,
               sortable: true
           },
           {
               xtype: 'treecolunm',
               text: 'Description',
               dataIndex: 'description',
               flex: 1,
               sortable: true
           }
       ],
       root: {
           name: 'root',
           description: 'root description',
           expanded: true,
           children: [
               {
                   name: 'child 1',
                   description: 'description 1',
                   leaf: true
               },
               {
                   name: 'child 2',
                   description: 'description 2',
                   leaf: true
               }
           ]
       }
    });
    Ext.getCmp('treeTabs').add(tree);
}

// store 树
function addBaseStoreTree(){
    var store = Ext.create('Ext.data.TreeStore', {
        root: {
            text: 'Root',
            expanded: true,
            children: [
                {
                    text: 'Child 1',
                    leaf: true
                },
                {
                    text: 'Child 2',
                    leaf: true
                }
            ]
        }
    });
    
    var tree = Ext.create('Ext.tree.Panel', {
        title: 'simpleTree',
        store: store
    });
     Ext.getCmp('treeTabs').add(tree);
}

// 基本树
function addBaseTree(){
    var treeStore = Ext.create('Ext.data.TreeStore', {
        fields: [ 
            'id', 'text', 'children', 'menuId',
        ],
        proxy: {
            type: 'ajax',
            url: contextPath + '/sysMenu/getChildrenByPid.do',
            reader: {
                type: 'json',
                root: 'children'
            },
            extraParams: {
                pid: '0'
            }
        },
        root: {  
            text: '根节点',  
            id: '0',  
            expanded: true  
        },  
        autoLoad: true
    });
    
    var tree = Ext.create('Ext.tree.Panel', {
       title: 'menu tree',
       rootVisible:false,
       store: treeStore,
       listeners: {
           'beforeitemexpand': function(node, optd){ // extjs 会自动处理其它 数据
               var tt=node.data.menuId;  // 不能使用id ，会和extjs 冲突
               console.log(node.data);
               treeStore.proxy.extraParams.pid = tt;
           }
       },
    });
    
    Ext.getCmp("treeTabs").add(tree);
}

