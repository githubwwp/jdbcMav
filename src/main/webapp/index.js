Ext.onReady(function() {
    
    var treeStore = Ext.create('Ext.data.TreeStore', {
        fields: [ 
            'text', 'menuId', 'menuPid', 'menuName', 'menuUrl', 'menuRemark', 'menuOrder', 
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

    Ext.create('Ext.container.Viewport', {
        layout : 'border',
        items : [ {
            id : 'north',
            region : 'north',
            border : false,
            margins : '0 0 5 0',
            title : 'top',
            tbar : [ 
                {   xtype : 'button', text : '菜单管理', iconCls: 'icon-th-list icon-large',
                    handler : function(){ window.open(contextPath + '/jsp/system/menuManage.jsp', '菜单管理'); }
                },
                {   xtype : 'button', text : '关闭所有tab页面', iconCls: 'icon-th-list icon-large',
                    handler : function(){ addCenterTab('菜单管理', '/jsp/system/menuManage.jsp'); } 
                }
            ]

        }, {
            id : 'west',
            region : 'west',
            collapsible : true,
            title : 'Navigation',
            autoScroll: true,
            width : 170,
            items : [
                {
                    xtype: 'treePanel',
                    id: 'menuTreePanel',
                    rootVisible:false,
                    autoScroll: true,
                    store: treeStore,
                    height: 400,
                    bodyPadding : 5,
                    listeners: {
                        'beforeitemexpand': function(node, optd){ // extjs 会自动处理其它 数据
                            var tt=node.data.menuId;  // 不能使用id ，会和extjs 冲突
                            treeStore.proxy.extraParams.pid = tt;
                        },
                        'itemclick': function(obj, record){ // 点击触发事件
                            var data = record.data;
                            var text = data.text;
                            if(data.leaf){
                                var url = data.menuUrl;
                                addCenterTab(text, url);
                            }
                        }
                    }
                }
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
});

function addTab() {
    var panel = Ext.create('Ext.panel.Panel', {
        bodyPadding : 5, // Don't want content to crunch against the borders
        closable : true,
        title : 'Filters',
        items : [ {
            xtype : 'datefield',
            fieldLabel : 'Start date'
        }, {
            xtype : 'datefield',
            fieldLabel : 'End date'
        } ]
    });
    var centerTabs = Ext.getCmp("center");
    centerTabs.add(panel);
}

// 添加百度
function addBaiDu() {
    var url = "http://www.baidu.com";
    var panel = Ext.create('Ext.panel.Panel', {
        bodyPadding : 5, // Don't want content to crunch against the borders
        closable : true,
        title : 'baidu ',
        html : "<iframe name='baiduIframe' src='" + url + "' style='overflow:auto; width:100%; height:100%;' frameborder='0'></iframe>"
    });
    var centerTabs = Ext.getCmp("center");
    centerTabs.add(panel);
}

// 添加google
function addGoogle() {
    var url = "https://www.google.com";
    var panel = Ext.create('Ext.panel.Panel', {
        bodyPadding : 5, // Don't want content to crunch against the borders
        closable : true,
        title : 'google ',
        html : "<iframe name='google' src='" + url + "' style='overflow:auto; width:100%; height:100%;' frameborder='0'></iframe>"
    });
    var centerTabs = Ext.getCmp("center");
    centerTabs.add(panel);
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

function test(){
    var data = [
        {id: '123', name: 'abc', age: 23}, 
        {id: '345', name: 'erge', age: 29}, 
        {id: '965', name: 'akibc', age: 56}
    ];
    var store  = Ext.create('Ext.data.Store', {
        fields: ['id', 'name'],
        proxy: {
            type: 'memory'
        },
        data: data
    });
    
}
