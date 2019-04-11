Ext.onReady(function(){
	
	 // 添加导航
    Ext.Ajax.request( {
        url : '/sysMenu/treePickerTest.do',
        method : 'post',
        success : function(rst) {
            var o = Ext.decode(rst.responseText);
            init(o);
        },
        failure : function(a) {
            alert(a.responseText);
        }
    });
	
	
});

function init(o){
	var form = Ext.create('Ext.form.Panel', {
		xtype: 'from',
		title: 'form',
		items: [
			{
				xtype: 'textfield',
				fieldLabel: 'name'
			},
			{
				id:'tree',
				fieldLabel: 'tree',
				xtype: 'treepicker',
//				xtype: 'tree',
				rootVisible : false,
				// 这里必须用 Ext.create 方法创建 treeStore
				store: Ext.create('Ext.data.TreeStore', {
			        root: o.root
				}),
				valueField: 'text',
				displayField : 'text'
			}
		]
	});
	
	new Ext.Viewport({
		layout: 'fit',
		items: [
			form
		]
	});
	
}