Ext.onReady(function() {
	
	store = Ext.create('Ext.data.TreeStore', {
        fields: [
        	'task', 'user', 'duration', 'done'
        ],
        proxy: {
            type: 'ajax',
            url: 'data/treeGrid.json'
            
        },
        autoLoad: true,
        folderSort: true
    });
    store.load();
	
	var grid = Ext.create('Ext.tree.Panel', {
		title: 'ab',
		store: store,
		 useArrows: true,
        rootVisible: false,
        columnLines: true,
        multiSelect: true,
         viewConfig: {
	        stripeRows: true
	    },
		columns: [
			{
				xtype: 'treecolumn', //this is so we know which column will show the tree
	            text: 'task',
	            width: 200,
	            sortable: true,
	            dataIndex: 'task'
			},
			{
				text: 'Assigned To',
	            width: 150,
	            dataIndex: 'user',
	            sortable: true
			},
			{
	            xtype: 'checkcolumn',
	            header: 'Done',
	            dataIndex: 'done',
	            width: 40,
	            stopSelection: false
	        }
		]
	});
	
	
	new Ext.Viewport({
        layout: 'fit',
        items: [
            grid
        ]
    });
	
	
});
