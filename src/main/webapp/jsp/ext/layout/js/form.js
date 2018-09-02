Ext.onReady(function() {
	var panel = Ext.create('Ext.Panel', {
		width : 500,
		height : 300,
		title : "FormLayout Panel",
		layout : 'form',
		bodyPadding : 5,
		defaultType : 'textfield',
		items : [ {
			fieldLabel : 'First Name',
			name : 'first',
			allowBlank : false
		}, {
			fieldLabel : 'Last Name',
			name : 'last'
		}, {
			fieldLabel : 'Company',
			name : 'company'
		}, {
			fieldLabel : 'Email',
			name : 'email',
			vtype : 'email'
		}, {
			fieldLabel : 'DOB',
			name : 'dob',
			xtype : 'datefield'
		}, {
			fieldLabel : 'Age',
			name : 'age',
			xtype : 'numberfield',
			minValue : 0,
			maxValue : 100
		}, {
			xtype : 'timefield',
			fieldLabel : 'Time',
			name : 'time',
			minValue : '8:00am',
			maxValue : '6:00pm'
		} ]
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