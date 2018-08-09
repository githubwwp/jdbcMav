
Ext.onReady(function(){
    
    var panel = Ext.create('Ext.panel.Panel', {
        title: 'panel', // 标题
       // html: 'this is a panel test', // 一段html 片段
        items: [ // 子组件集合
            {
                xtype: 'datefield'
            }
        ],
        border: '10 5 20 3',
        defaults: { // 应用于所有子组件
            autoScroll: true
        },
        disabled: false, // 组件是否不可用
        style: { // 自定义组件样式
            border: '1px solid orange'
        },
        frame: true, // 填充画面
        hidden: false, // 是否隐藏
        id: 'panel', // 当前组件实例唯一ID 
        layout: { // 布局
            type: 'anchor'
        },
        listeners:{ // 事件监听
            afterlayout: function(){
                console.log("panel layout complate");
            }
        },
        margin: '10 20 5 3', // 外边距
        padding: '10 20 5 3', // 内边距
        autoScroll: true, // 必要时显示滚动条
//        bbar: [ // 底部
//            {   xtype: 'button', text: 'button 1' }
//        ],
        buttonAlign: 'center',
        buttons: [
            {   xtype: 'button', text: 'buttons' }          
        ],
        closable: true, // 是否可关闭
        collapsible: true, // 是否可折叠
        tbar: [
            {   xtype: 'button', text: 'lbutton'},
            {   xtype: 'button', text: 'modelTest', handler: modelTest }
        ],
//        lbar: [
//               { xtype: 'button', text: 'Button 1' }
//           ],
//        rbar: [
//            { xtype: 'button', text: 'Button 1' }
//        ],
        header: true,
        // icon: '图标路劲'
        
        
        
    });
    
    
    var Viewport = Ext.create('Ext.container.Viewport', {
        layout: 'fit',
        items: [
            panel
        ]
    });
    
});


// modelTest 
function modelTest(){
    Ext.define('User', {
       extend: 'Ext.data.Model',
       fields: [
           {   name: 'id' },
           {   name: 'name'}
       ]
    });
    
    STORE = Ext.create('Ext.data.Store',{
        model: 'User',
        autoLoad: true,
        proxy: {
            type: 'ajax',
            url: contextPath+'/gridData/getModelData.do',
            reader: {
                type: 'json', 
                root: 'datas'
            }
        }
    });
}

