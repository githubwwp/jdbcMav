Ext.onReady(function() {

	// Ext.define('User', {
	// extend : 'Ext.data.Model',
	// fields : [ 'name', 'age', 'phone', 'alive' ],
	// hasMany : 'Post'
	// });
	//
	// Ext.define('Post', {
	// extend : 'Ext.data.Model',
	// fields : [ 'id', 'user_id' ]
	// });
	//
	// store = Ext.create('Ext.data.Store', {
	// model : 'User',
	// proxy : {
	// type : 'ajax',
	// url : contextPath + '/jsData/modelData.do',
	// reader : {
	// type : 'json',
	// root : 'users'
	// }
	// },
	// autoLoad : true
	// });

	Ext.define('TestResult', {
	    extend: 'Ext.data.Model',
	    fields: ['student', 'subject', {
	        name: 'mark',
	        type: 'int'
	    }]
	});

	Ext.create('Ext.grid.Panel', {
	    width: 200,
	    height: 240,
	    renderTo: document.body,
	    features: [{
	        groupHeaderTpl: 'Subject: {name}',
	        ftype: 'groupingsummary'
	    }],
	    store: {
	        model: 'TestResult',
	        groupField: 'subject',
	        data: [{
	            student: 'Student 1',
	            subject: 'Math',
	            mark: 84
	        },{
	            student: 'Student 1',
	            subject: 'Science',
	            mark: 72
	        },{
	            student: 'Student 2',
	            subject: 'Math',
	            mark: 96
	        },{
	            student: 'Student 2',
	            subject: 'Science',
	            mark: 68
	        }]
	    },
	    columns: [{
	        dataIndex: 'student',
	        text: 'Name',
	        summaryType: 'count',
	        summaryRenderer: function(value){
	            return Ext.String.format('{0} student{1}', value, value !== 1 ? 's' : '');
	        }
	    }, {
	        dataIndex: 'mark',
	        text: 'Mark',
	        summaryType: 'average'
	    }]
	});

});
