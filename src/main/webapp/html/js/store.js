Ext.onReady(function(){
	
	var treeStore = Ext.create('Ext.data.TreeStore', {
        fields: [ 
            'text', 'menuId', 'menuPid', 'menuName', 'menuUrl', 'menuRemark', 'menuOrder'
        ],
        proxy: {
            type: 'ajax',
            url: '/sysMenu/queryMenuVos.do',
            reader: {
                type: 'json',
                root: 'sysMenuChildVo'
            },
            root: {
            	text: '根节点',  
	            id: '0',  
	            expanded: true  
            	
            }
        },
        autoLoad: true
    });
	
	var form = Ext.create('Ext.form.Panel', {
		xtype: 'from',
		title: 'form',
		items: [
			{
				xtype: 'textfield',
				fieldLabel: 'name'
			},
			{
				fieldLabel: 'tree',
				xtype: 'treepicker',
				store: treeStore,
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
	
});