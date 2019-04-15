Ext.onReady(function() {
	
    var panel = Ext.create('Ext.panel.Panel', {
        width: '60%',
        height: '60%',
        layout: 'fit',
        items: [
	        {
	        	xtype: 'yh-tree',
	        	id: 'yh'
	        }
        ]
    });

    Ext.create('Ext.container.Viewport', {
		layout : {
			align : 'middle',
			type : 'hbox',
			pack : 'center'
		},
		items : panel
	});
	
	// 加载
	Ext.getCmp('yh').load();

});


// 定义树
Ext.define('Ext.ux.baseTree', {
	extend : 'Ext.tree.Panel',
	xtype: 'yh-tree',
	useArrows: true,
	frame: true,
	rootVisible: false,
	title: 'base tree',
	defaultRoot: {},
	url: 'data/baseTree.json',
	
	initComponent: function(){
		var me = this;
		this.listeners = this.listeners || {};
		
		// 配置
		Ext.apply(me, {
			store: new Ext.data.TreeStore({
				root: {text: 'ro', id: -1}
			})
		});
		
		me.callParent();
	}, 
	// 加载
	load: function(){
		var me = this;
		
		// 获取数据
	    Ext.Ajax.request( {
	        url : me.url,
	        method : 'post',
	        success : function(rst) {
	            var root = Ext.decode(rst.responseText);
	            me.store.setRootNode(root);
	        },
	        failure : function(a) {
	            alert(a.responseText);
	        }
	    });
	}
})







