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
    var tree = Ext.create('Ext.tree.Panel', {
       title: 'Simple Tree',
       rootVisible: false,
       tbar: [
           {
               xtype: 'button',
               text: 'add sub tree',
               handler: function(){
                   var root = tree.getRootNode();
                   var parent = root.appendChild({
                       text: 'Parent 1',
                       expanded: true,
                       children: [{
                           text: 'Child 3',
                           leaf: true
                       }]
                   });
               }
           }
       ],
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
               },
               {
                   text: 'Child 3',
                   expanded: true,
                   children: [
                       {
                           text: 'Grandchild',
                           leaf: true
                       }            
                   ]
               }
           ]
       }
    });
    Ext.getCmp("treeTabs").add(tree);
}


/*Ext.onReady(function() {
    //树节点配置[root>>children]每个节点有： text显示文本, leaf是否是叶子, expanded是否展开，等属性。  
    var store = Ext.create('Ext.data.TreeStore', {
        root : {
            expanded : true,
            children : [ {
                text : "detention",
                leaf : true
            }, {
                text : "homework",
                expanded : true,
                children : [ {
                    text : "book",
                    leaf : true
                }, {
                    text : "alegrbra",
                    leaf : true
                } ]
            }, {
                text : "tickets",
                leaf : true
            } ]
        }
    });
    //创建TreePanel rootVisible表示根节点是否显示  
    Ext.create('Ext.tree.Panel', {
        title : 'Simple Tree',
        width : 200,
        height : 150,
        rootVisible : false,
        root : {
            expanded : true,
            children : [ {
                text : "detention",
                leaf : true
            }, {
                text : "homework",
                expanded : true,
                children : [ {
                    text : "book",
                    leaf : true
                }, {
                    text : "alegrbra",
                    leaf : true
                } ]
            }, {
                text : "tickets",
                leaf : true
            } ]
        },
        renderTo : Ext.getBody()
    });
});*/