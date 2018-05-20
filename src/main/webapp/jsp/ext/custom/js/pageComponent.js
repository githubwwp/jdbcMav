Ext.onReady(function() {

	var store = Ext.create('Ext.data.Store', {
		pageSize : 15,
		fields : [ 'menuId', 'menuPid', 'menuName' ],
		proxy : {
			type : 'ajax',
			url : contextPath + "/sysMenu/loadPageMenus.do",
			reader : {
				root : 'pageEntity.resultList',
				totalProperty : 'pageEntity.count'
			}
		}
	});

	var grid = Ext.create('Ext.grid.Panel', {
		title : 'pageGridTest',
		loadMask : true,
		store : store,
		columns : [ {
			text : '菜单编号',
			dataIndex : 'menuId',
			flex : 1,
			sortable : false
		}, {
			text : '菜单父编号',
			dataIndex : 'menuPid',
			flex : 1
		}, {
			text : '菜单描述',
			dataIndex : 'menuName',
			flex : 1
		} ],
		bbar : Ext.create('Ext.PagingToolbar', {
			store : store,
			displayInfo : true,
			displayMsg : 'Displaying topics {0} - {1} of {2}',
			emptyMsg : "No topics to display",
			items : [ '-', {
				text : 'Show Preview',
				pressed : true,
				enableToggle : true
			} ]
		}),

	});

	Ext.create('Ext.container.Viewport', {
		layout : 'fit',
		items : [ grid ]
	});

	store.loadPage(1);
});
