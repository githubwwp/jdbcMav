Ext.onReady(function(){
    Ext.create('Ext.container.Viewport', {
        id: 'viewPort',
        layout: 'anchor', 
        items: [
            {
                xtype: 'button', 
                text: 'test',
                handler: test
            },
            {
                xtype: 'textfield',
                fieldLabel: '姓名',
                labelWidth: 50
            },
            {
                xtype: 'numberfield',
                fieldLabel: '年龄',
                labelWidth: 50
            },
            {
                xtype: 'button',
                text: '提交'
            }
        ]
    });
});

function test(){
    if(confirm("是否确认?")){
        Ext.Msg.alert("提示：", "您点击的是确定");
    }
}