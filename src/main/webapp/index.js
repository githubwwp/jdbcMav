// 自定义延时任务
var treeSearchTask = new Ext.util.DelayedTask(filterTree);

Ext.onReady(function() {
	
    
    Ext.create('Ext.container.Viewport', {
        layout : 'border',
        items : [ {
            id : 'north',
            region : 'north',
            border : false,
            margins : '0 0 5 0',
            title : 'top',
            tbar : [ 
                {   xtype : 'button', text : '菜单管理', iconCls: 'icon-th-list icon-large icon-color-primary',
                    handler : function(){ window.open(contextPath + '/jsp/system/menuManage.jsp', '菜单管理'); }
                },
                {   xtype : 'button', text : '关闭tab', iconCls: 'icon-remove-sign icon-large icon-color-danger',
                    menu: {
                        xtype: 'menu',
                        items: [
                            {   text: '关闭其它tab', handler: closeOtherTabs },
                            {   text: '关闭全部tab', handler: closeAllTabs }
                        ]
                    }
                },
                {   xtype : 'button', text : '图库链接', iconCls: 'icon-link icon-large icon-color-info',
                    handler : function(){ window.open('http://www.bootcss.com/p/font-awesome/'); }
                }
            ]
        }, {
            id : 'west',
            region : 'west',
            collapsible : true,
            title : 'Navigation',
            layout: 'fit',
            autoScroll: true,
            width : 250,
            items : [
            ]
        // could use a TreePanel or AccordionLayout for navigational items
        }, {
            id : 'south',
            region : 'south',
            title : 'South Panel',
            collapsible : true,
            hidden: true,
            html : 'Information goes here',
            split : true,
            height : 100,
            minHeight : 100
        }/*, {
            id : 'east',
            region : 'east',
            title : 'East Panel',
            collapsible : true,
            split : true,
            width : 150
        }*/, {
            id : 'center',
            region : 'center',
            xtype : 'tabpanel', // TabPanel itself has no title
            activeTab : 0, // First tab active by default
            items : {
                title : 'Default Tab',
                html : 'The first tab\'s content. Others may be added dynamically'
            }
        } ]
    });
    
    // 添加导航
    Ext.Ajax.request( {
        url : contextPath + '/sysMenu/queryMenuVos.do',
        method : 'post',
        success : function(rst) {
            var o = Ext.decode(rst.responseText);
            addWestNav(o);
        },
        failure : function(a) {
            alert(a.responseText);
        }
    });
});

// 添加导航
function addWestNav(o){
    var treeStore = Ext.create('Ext.data.TreeStore', {
        fields: [ 
            'text', 'menuId', 'menuPid', 'menuName', 'menuUrl', 'menuRemark', 'menuOrder', 'children'
        ],
        root: o.sysMenuChildVo
    });
    
    var treePanel = Ext.create('Ext.tree.Panel', {
        id: 'menuTreePanel',
        rootVisible:false,
        autoScroll: true,
        height: 400,
        bodyPadding : 5,
        store: treeStore,
        dockedItems:[
            {   xtype:'toolbar', dock:'top',  
                items:[
                    {   xtype: 'button', text: '展开', iconCls: 'icon-sort-down icon-large icon-color-info',
                        handler: function(){ treePanel.expandAll(); }
                    },
                    {   xtype: 'button', text: '收起', iconCls: ' icon-sort-up icon-large icon-color-info',
                        handler: function(){ treePanel.collapseAll(); }
                    },
                    {
                        xtype: 'button', text: '刷新', iconCls: ' icon-refresh icon-large icon-color-info'
                    }
                ] 
            },
             {   xtype:'toolbar', dock:'top',  
                 items:[
                     {
                        xtype: 'textfield',
                        emptyText: '搜索(可正则表达式)...',
                        id : 'treeFilterTextId',
                        listeners: {
                            'change': function(){
                            	treeSearchTask.delay(400);
                            }
                        }
                     }
                 ] 
             }
         ],
        
        listeners: {
            'itemclick': function(obj, rec){
                var data = rec.data;
                if(data.leaf){
                    addCenterTab(data.text, data.menuUrl); // 添加tab
                }
            }
		}
    });

    
    Ext.getCmp("west").add(treePanel);
    treePanel.expandNode(treePanel.getRootNode()); // 展开根节点
    
}

// 动态添加
function addCenterTab(title, url) {
    
    // title 或 url 为空， 提示错误
    if (!title || !url) {
        Ext.Msg.alert("提示：", "地址不存在");
        return;
    }

    var centerTabs = Ext.getCmp("center");
    var tabId = title + "_id";
    var tab = centerTabs.getComponent(tabId);
    url = contextPath + url;
    
    // 如果panel不存在，新建一个panel，并添加到tabPanel中。
    if (!tab) {
        tab = Ext.create('Ext.panel.Panel', {
            id : tabId,
            bodyPadding : 5,
            closable : true,
            title : title,
            html : "<iframe name='google' src='" + url + "' style='overflow:auto; width:100%; height:100%;' frameborder='0'></iframe>"
        });
        centerTabs.add(tab);
    }

    centerTabs.setActiveTab(tab); // 设置显示当前面板
}

// 关闭其它 tab
function closeOtherTabs(){
    var centerTabs = Ext.getCmp("center");
    centerTabs.items.each(function(item){
        if(item.closable && centerTabs.activeTab != item){
            item.close();
        }
    });
}

// 关闭全部tab
function closeAllTabs(){
    var centerTabs = Ext.getCmp("center");
    centerTabs.items.each(function(item){
        if(item.closable){
            item.close();
        }
    });
}


// 过滤目录
function filterTree(){
    console.log(3);
	
    // 清除过滤
    var tp = Ext.getCmp('menuTreePanel'); // treePanel 对象
    var val = Ext.getCmp('treeFilterTextId').getValue(); // 过滤条件
    var view = tp.getView();
    tp.getRootNode().cascadeBy(function(tree, view) {
        var uiNode = view.getNodeByRecord(this);

        if (uiNode) {
            Ext.get(uiNode).setDisplayed('table-row');
        }
    }, null, [tp, view]);
    
    if(!val){
        return;
    }
    
    // 过滤
    var nodesAndParents = [];
    tp.getRootNode().cascadeBy(function(tree, view) {
        var currNode = this;
        var text = currNode.data.text;
        
        if (new RegExp(val.replace(/\\/g, '\\\\')).test(text)) {
//            tp.expandPath(currNode.getPath()); // invalid

            while (currNode.parentNode) {
                currNode.expand();
                nodesAndParents.push(currNode.id);
                currNode = currNode.parentNode;
            }
        }
    }, null, [tp, view]);

    
    // 隐藏其它节点
    tp.getRootNode().cascadeBy(function(tree, view) {
        var uiNode = view.getNodeByRecord(this);

        if (uiNode && !Ext.Array.contains(nodesAndParents, this.id)) {
            Ext.get(uiNode).setDisplayed('none');
        }
    }, null, [tp, view]);
}

