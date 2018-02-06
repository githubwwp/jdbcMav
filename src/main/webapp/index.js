Ext.onReady(function() {

    Ext.create('Ext.container.Viewport', {
        layout : 'border',
        items : [ {
            id : 'north',
            region : 'north',
            border : false,
            margins : '0 0 5 0',
            title : 'top',
            tbar : [ {
                xtype : 'button',
                text : '添加选项卡',
                handler : addTab
            }, {
                xtype : 'button',
                text : '添加百度页面',
                handler : addBaiDu
            }, {
                text : '添加 google',
                handler : addGoogle
            } ]

        }, {
            id : 'west',
            region : 'west',
            collapsible : true,
            title : 'Navigation',
            autoScroll: true,
            width : 150,
            items : [ 
                {   xtype : 'treePanel', rootVisible : true, 
                    root : {
                        expanded : true,
                        children : [ 
                            {   text : "storeTest", leaf : true, url : contextPath + '/jsp/jspTest/storeTest.jsp' }, 
                            {   text : "layoutTest", leaf : true, url : contextPath + '/jsp/jspTest/layoutTest.jsp' }, 
                            {   text : "treeTest", leaf : true, url : contextPath + '/jsp/jspTest/treeTest.jsp' }, 
                            {   text : "gridTest", leaf : true, url : contextPath + '/jsp/jspTest/gridTest.jsp' }, 
                            {   text : "homework", expanded : true,
                                children : [ 
                                    {   text : "panelTest", leaf : true, url : contextPath + '/jsp/jspTest/panelTest.jsp' }, 
                                    {   text : "alegrbra", leaf : true }
                                ] 
                            }, 
                            {   text : "formTest", leaf : true, url : contextPath + '/jsp/jspTest/formTest.jsp' }
                        ]
                    },
                    listeners : {
                        'itemclick' : function(obj, td, cellIndex, record, tr, rowIndex, e, eOpts) {
                            var text = td.raw['text'];
                            var url = td.raw['url'];
                            addCenterTab(text, url);
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
