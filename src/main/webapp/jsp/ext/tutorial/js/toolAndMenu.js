Ext.onReady(function() {
			Ext.Msg.alert('note', 'this is a note window.');
			Ext.create('Ext.panel.Panel', {
						title : 'Hello',
						width : 200,
						html : '<p>World!</p>',
						tbar : {
							items : [{
										xtype : 'button',
										text : 'abc'
									}]
						},
						renderTo : Ext.getBody(),
						closable : false,
						autoShow : false,
						autoEl : Ext.getBody()
					});

		});

function aa() {
	document.getElementById("")

}