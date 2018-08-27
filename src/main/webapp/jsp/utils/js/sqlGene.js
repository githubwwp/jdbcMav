Ext.onReady(function() {

	var panel = Ext.create('Ext.panel.Panel', {
		title : 'head',
		layout : {
			type : 'hbox',
			align : 'stretch'
		},
		defaults : {
			layout : 'fit',
			width : '100%',
		},
		dockedItems : [ {
			dock : 'bottom',
			html : '<div style="color: red; text-align: center;">自动生成sql</div>'
		} ],
		items : [ {
			xtype : 'panel',
			title : 'origin text',
			flex : 1,
			items : [ {
				id : 'originTextId',
				xtype : 'textarea'
			} ]
		}, {
			xtype : 'toolbar',
			width : 70,
			layout : {
				type : 'vbox',
				align : 'stretch'
			},
			defaults : {
				style : {
					'margin-bottom' : 20
				}
			},
			items : [ '->', {
				text : 'sql to StringBuffer',
				handler : sqlToSb
			}, {
				text : 'get table fields',
				handler: getTableFields
			}, '->' ]
		}, {
			xtype : 'panel',
			title : 'gene text',
			flex : 1,
			items : [ {
				xtype : 'textarea',
				id : 'geneTextId'
			} ]
		} ]

	});

	// viewport
	Ext.create('Ext.container.Viewport', {
		id : 'viewPort',
		layout : 'fit',
		items : [ panel ]
	});

});

function sqlToSb() {
	var originVal = Ext.getCmp('originTextId').getValue();
	if (originVal) {
		var url = contextPath + "/util/sqlToSb.do";
		MT.ajax(url, {str: originVal}, function(text){
			Ext.getCmp('geneTextId').setValue(Ext.decode(text).str);
		});
	} else {
		Ext.Msg.alert('tip: ', '请输入源文本！');
	}
}

function getTableFields(){
	var originVal = Ext.getCmp('originTextId').getValue();
	if (originVal) {
		var url = contextPath + "/util/getTableFields.do";
		MT.ajax(url, {str: originVal}, function(text){
			Ext.getCmp('geneTextId').setValue(Ext.decode(text).str);
		});
	} else {
		Ext.Msg.alert('tip: ', '请输入源文本！');
	}
}