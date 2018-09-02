Ext.onReady(function() {

	var con = Ext.create('Ext.container.Container', {
		width : 800,
		height : 300,
		layout : {
			type : 'hbox',
			align : 'stretch'
		},
		items : [ {
			xtype : 'form',
			flex : 2,
			title : 'form',
			items : [ {
				fieldLabel : 'abc'
			} ]
		}, {
			xtype : 'grid',
			flex : 1,
			title : 'grid',
			columns : [ {
				text : 'col1'
			}, {
				text : 'col2'
			} ]
		}]
	});

	Ext.create('Ext.container.Viewport', {
		layout : {
			type : 'fit'
		},
		items : [ {
			xtype : 'container',
			autoScroll : true,
			layout : {
				align : 'middle',
				type : 'hbox',
				pack : 'center'
			},
			items : con
		} ]
	});
	

});

function jsTest(){
	
	var obj = {};
	var arr = [];
	arr.join("'");
	
}


