Ext.onReady(function(){
    // 选项卡
    var tabs = Ext.create('Ext.tab.Panel', {
        id: 'gridTabs',
        defaults: {
        },
        frame: true, tabPosition: 'bottom'
    });
    
    // 页面视图
    Ext.create('Ext.container.Viewport', {
        layout: 'fit', 
        items: [
           tabs
        ]
    });
    
    // 添加tab
    addView();
    
    
    // 
    
});

// 测试
function addView(){
    var childPanel1 = Ext.create('Ext.panel.Panel', {
        width: 200,
        height: 100,
        floating: true, // make this panel an absolutely-positioned floating component
        title: 'Test',
        draggable:true,
        html: 'Test Panel'
    });
    
    var childPanel2 = Ext.create('Ext.panel.Panel', {
        title: 'panel 2',
        html: 'Another panel'
    });
    
    Ext.create('Ext.container.Viewport', {
       items: [
           childPanel1, childPanel2
       ] 
    });
    
    childPanel1.show();
    
}

