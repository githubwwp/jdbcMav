var num = 6;

Ext.onReady(function() {

	tab = Ext.create('Ext.wwp.CustomTable', {
		columns: 3,
		items : [ {
			name : 'a',
			html : ' A content',
		}, {
			name : 'b',
			isTip: true,
			html : 'Cell A content Cell A content Cel sdfwe w l A content Cell A content Cell A content Cel sdfwe w l A content Cell A content Cell A content Cel sdfwe w l A content'
		}, {
			name : '',
			html : 'Cell B content'
		}, {
			html : 'Cell C content',
			cellCls : 'highlight'
		}, {
			html : 'Cell D content',
			id : 'clearButton'
		} ],
		renderTo : Ext.getBody()
	});
});
