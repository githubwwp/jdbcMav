Ext.onReady(function() {
	
    var panel = Ext.create('Ext.panel.Panel', {
        width: '60%',
        height: '60%',
        layout: 'column',
    	autoScroll: true,
        items: [
	        {	
	        	xtype: 'dcms_tree',
	        	columnWidth: 0.5,
	        	url: 'data/baseTree.json',
	        	displayField: 'task',
	        	storeFields: ['id', 'text', 'task'],
	        	defaultLoad: true
	        },
	        {
	        	xtype: 'dcms_tree',
	        	columnWidth: 0.5,
	        	url: 'data/baseFlatData.json',
	        	idConvertData: true,
	        	storeFields: ['id', 'text', 'task'],
	        	defaultLoad: true
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
	

});


/*
 * 自定义树组件 by wwp 2019-04-15
 * url: 请求后台接口  (必填)
 * storeFields: store 配置字段
 * idDefaultLoad: 是否初始化加载(boolean 类型)
 * idConvertData: 是否需要格式化数据 (boolean类型)
 * 
 */
Ext.define('Ext.ux.baseTree', {
	extend : 'Ext.tree.Panel',
	xtype: 'dcms_tree',
	escapePid: '!@#',
	
	useArrows: true,
	frame: true,
	rootVisible: false,
	
	initComponent: function(){
		var me = this;
		this.listeners = this.listeners || {};
		
		// 配置
		Ext.apply(me, {
			autoLoad: false, // 强制 autoLoad 无效(测试设置为true 会报错)
			store: new Ext.data.TreeStore({
				fields: me.storeFields
			})
		});
		
		// 自动加载
		if(me.defaultLoad){
			me.load();
		}
		
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
	            if(me.idConvertData){
	            	root = me.convertDataFormat(root);
	            }
	            
	            me.store.setRootNode(root);
	        },
	        failure : function(a) {
	            alert(a.responseText);
	        }
	    });
	},
	// 转换数据格式
	convertDataFormat: function(flatData){
		var me = this;
		var idArr = [];
		var treeData = { text: 'root', id: me.escapePid };
		
		// 获取全部 id
		for(var i=0, len=flatData.length; i< len; i++){
			var obj = flatData[i];
			idArr.push(obj.id);
		}
		
		// 去重
		Ext.Array.unique(idArr);
		
		//  获取需要展示的根节点, 将其根节点设置为 '!@#'
		for(var i=0, len=flatData.length; i< len; i++){
			var obj = flatData[i];
			if(!Ext.Array.contains(idArr, obj.pid)){
				obj.pid = me.escapePid;
			}
		}
		
		// 递归
		me.getNodeChildren(treeData, flatData);
		
		return treeData;
	},
	// 取叶子节点
	getNodeChildren: function(pObj, flatData) {
	    var i = 0,
	        j = 0,
	        len = flatData.length;
	
	    // 遍历全部数据
	    for (; i < len; i++) {
	        var obj = flatData[i];
	
	        if (obj.pid == pObj.id) {
	            pObj.children = pObj.children || [];
	            pObj.children.push(obj);
	
	            this.getNodeChildren(obj, flatData);
	        }
	    }
	
	    // 设置叶子节点
	    if (Ext.isEmpty(pObj.children)) {
	        pObj.leaf = true;
	    } else {
	       	pObj.expanded = false;
	    }
	}
	
});








