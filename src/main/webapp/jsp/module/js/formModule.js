var required = '<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';

Ext.onReady(function() {
	Ext.QuickTips.init();
	Ext.define('Ext.wwp.form', {
		extend : Ext.panel.Panel,
		alias : [ 'widget.wwpform' ],
		initComponent : function() {
			Ext.apply(this, {
				title : '表单测试',
				tbar : [ {
					xtype : 'button',
					text : 'simple form',
					handler : showSimpleForm
				}, {
					xtype : 'button',
					text : 'fieldset form',
					handler : showFieldsetForm
				}, {
					xtype : 'button',
					text : 'complex form',
					handler : showComplexForm
				}, {
					xtype : 'button',
					text : 'tab panel',
					handler : showTabPanelForm
				}, {
					xtype : 'button',
					text : 'contact us form',
					handler : showContactUsForm
				}, {
					xtype : 'button',
					text : 'field type form',
					handler : showFieldTypeForm
				}, {
					xtype : 'button',
					text : 'radioGroups',
					handler : showRadioGroupForm
				}, {
					xtype : 'button',
					text : 'multi select form',
					handler : showMultiSelectForm
				}, {
					xtype : 'button',
					text : 'layout form',
					menu : [ {
						text : 'anchor form',
						handler : showAnchorForm
					}, {
						text : 'vbox form',
						handler : showVboxForm
					}, {
						text : 'hbox form',
						handler : showHboxForm
					}, {
						text : 'absolute form',
						handler : showAbsoluteForm
					} ]
				} ]
			});
			this.callParent();
		}
	});

	Ext.create('Ext.container.Viewport', {
		layout : 'fit',
		items : [ {
			xtype : 'wwpform'
		} ]
	});

	// TODO
	showAbsoluteForm();

});

function showSimpleForm() {
	var form = Ext.create('Ext.form.Panel', {
		layout : 'form',
		autoScroll : true,
		bodyPadding : '5 5 5 5',
		fieldDefaults : {
			msgTarget : 'side', // 错误提示位置放在最后'
			labelWidth : 100
		},
		defaultType : 'textfield',
		items : [ {
			fieldLabel : 'first name',
			afterLabelTextTpl : required,
			name : 'first',
			allowBlank : false,
			tooltip : 'enter your first name'
		}, {
			fieldLabel : 'lastName',
			afterLabelTextTpl : required,
			name : 'last',
			allowBlank : false,
			tooltip : 'enter your last name'
		}, {
			fieldLabel : 'company',
			name : 'company'
		}, {
			fieldLabel : 'email',
			afterLabelTextTpl : required,
			name : 'email',
			allowBlank : false,
			vtype : 'email'
		}, {
			fieldLabel : 'DOB',
			name : 'dob',
			xtype : 'datefield'
		}, {
			fieldLabel : 'age',
			xtype : 'numberfield',
			minValue : 0,
			maxValue : 100
		}, {
			xtype : 'timefield',
			fieldLabel : 'time',
			name : 'time',
			minValue : '6:00 AM', // TODO
			maxValue : '8:00 PM',
			increment : 60
		} ],
		buttons : [ {
			text : 'save',
			handler : function() {
				this.up('form').getForm().isValid();
			}
		}, {
			text : 'cancel',
			handler : function() {
				this.up('form').getForm().reset();
			}
		} ]
	});

	Ext.create('Ext.window.Window', {
		title : 'simple form',
		width : 400,
		height : 400,
		modal : true,
		layout : 'fit',
		items : [ form ]
	}).show();
}

function showFieldsetForm() {
	var form = Ext.create('Ext.form.Panel', {
		bodyPadding : '5 5 5 5',
		fieldDefaults : {
			msgTarget : 'side',
			labelWidth : 75
		},
		defaults : {
			anchor : '100%'
		},
		items : [ {
			xtype : 'fieldset', // 第一个fieldSet
			checkboxToggle : true,
			title : 'user Information',
			defaultType : 'textfield',
			collapsed : true,
			layout : 'anchor',
			defaults : {
				anchor : '100%'
			},
			items : [ {
				fieldLabel : 'first name',
				afterLabelTextTpl : required,
				name : 'first',
				allowBlank : false
			}, {
				fieldLabel : 'last name',
				afterLabelTextTpl : required,
				name : 'last'
			}, {
				fieldLabel : 'company',
				afterLabelTextTpl : required,
				name : 'email',
				vtype : 'email'
			} ]
		}, {
			xtype : 'fieldset', // 第二个fieldset
			title : 'phone number',
			collapsible : true,
			defaultType : 'textfield',
			layout : 'anchor',
			defaults : {
				anchor : '100%'
			},
			items : [ {
				fieldLabel : 'home',
				name : 'home',
				value : '(888) 555-1212'
			}, {
				fieldLabel : 'business',
				name : 'business'
			}, {
				fieldLabel : 'mobile',
				name : 'mobile'
			}, {
				fieldLabel : 'fax',
				name : 'fax'
			} ]
		} ],
		buttons : [ {
			text : 'save'
		}, {
			text : 'cancel'
		} ]
	});

	Ext.create('Ext.window.Window', {
		title : 'fieldset form',
		width : 400,
		height : 400,
		modal : true,
		layout : 'fit',
		items : [ form ]
	}).show();
}

function showComplexForm() {

	var form = Ext.create('Ext.form.Panel', {
		fieldDefaults : {
			labelAlign : 'top',
			msgTarget : 'side'
		},
		items : [ {
			xtype : 'container',
			anchor : '100%',
			layout : 'hbox',
			items : [ {
				xtype : 'container',
				flex : 1,
				layout : 'anchor',
				items : [ {
					xtype : 'textfield',
					fieldLabel : 'first name',
					afterLabelTextTpl : required,
					allowBlank : false,
					name : 'first',
					anchor : '95%',
					value : 'don'
				}, {
					xtype : 'textfield',
					fieldLabel : 'company',
					name : 'company',
					anchor : '95%',
				} ]
			}, {
				xtype : 'container',
				flex : 1,
				layout : 'anchor',
				items : [ {
					xtype : 'textfield',
					fieldLabel : 'last name',
					afterLabelTextTpl : required,
					allowBlank : false,
					anchor : '100%',
					value : 'griffin'
				}, {
					xtype : 'textfield',
					fieldLabel : 'email',
					afterLabelTextTpl : required,
					allowBlank : false,
					name : 'email',
					vtype : 'emai',
					anchor : '100%'
				} ]
			} ]
		}, {
			xtype : 'htmleditor',
			name : 'bio',
			fieldLabel : 'biography',
			height : 200,
			anchor : '100%'
		} ],
		buttons : [ {
			text : 'save',
			handler : function() {
				this.up('form').getForm().isValid();
			}
		}, {
			text : 'cancel',
			handler : function() {
				this.up('form').getForm().reset();
			}
		} ]
	});

	Ext.create('Ext.window.Window', {
		title : 'complex form',
		width : 400,
		height : 400,
		modal : true,
		layout : 'fit',
		items : [ form ]
	}).show();
}

function showTabPanelForm() {
	var form = Ext.create('Ext.form.Panel', {
		collapsible : true,
		autoScroll : true,
		bodyPadding : 5,
		fieldDefaults : {
			labelAlign : 'top',
			msgTarget : 'side'
		},
		detaults : {
			anchor : '100%'
		},
		items : [ {
			xtype : 'container',
			layout : 'hbox',
			items : [ {
				xtype : 'container',
				flex : 1,
				border : false,
				layout : 'anchor',
				defaultType : 'textfield',
				items : [ {
					fieldLabel : 'first name',
					afterLabelTextTpl : required,
					allowBlank : false,
					name : 'first',
					anchor : '95%'
				}, {
					fieldLabel : 'company',
					name : 'company',
					anchor : '95%'
				} ]
			}, {
				xtype : 'container',
				flex : 1,
				layout : 'anchor',
				defaultType : 'textfield',
				items : [ {
					fieldLabel : 'last name',
					afterLabelTextTpl : required,
					allowBlank : false,
					name : 'last',
					anchor : '95%'
				}, {
					fieldLabel : 'email',
					afterLabelTextTpl : required,
					allowBlank : false,
					name : 'email',
					vtype : 'email',
					anchor : '95%'
				} ]
			} ]
		}, {
			xtype : 'tabpanel',
			plain : true,
			activeTab : 0,
			defaults : {
				bodyPadding : 10
			},
			items : [ {
				title : 'personal details',
				defaults : {
					width : 230
				},
				defaultType : 'textfield',
				items : [ {
					fieldLabel : 'first name',
					name : 'first',
					value : 'jamie'
				}, {
					fieldLabel : 'last name',
					name : 'last',
					value : 'avins'
				}, {
					fieldLabel : 'company',
					name : 'company',
					value : 'ext js'
				}, {
					fieldLabel : 'email',
					name : 'email',
					vtype : 'email'
				} ]
			}, {
				title : 'phone numbers',
				defaults : {
					width : 230
				},
				defaultType : 'textfield',
				items : [ {
					fieldLabel : 'home',
					name : 'home',
					value : '(888) 555-1212'
				}, {
					fieldLabel : 'business',
					name : 'business'
				}, {
					fieldLabel : 'mobile',
					name : 'mobile'
				}, {
					fieldLabel : 'fax',
					name : 'fax'
				} ]
			}, {
				title : 'biography',
				layout : 'fit',
				items : [ {
					xtype : 'htmleditor',
					name : 'bio2',
					fieldLabel : 'bioraphy'
				} ]
			} ]
		} ],
		buttons : [ {
			text : 'save',
			handler : function() {
				this.up('form').getForm().isValid();
			}
		}, {
			text : 'cancel',
			handler : function() {
				this.up('form').getForm().reset();
			}
		} ]
	});

	Ext.create('Ext.window.Window', {
		title : 'tab panel form',
		width : 400,
		height : 400,
		modal : true,
		layout : 'fit',
		items : [ form ]
	}).show();
}

function showContactUsForm() {
	var form = Ext
			.create(
					'Ext.form.Panel',
					{
						layout : {
							type : 'vbox',
							align : 'stretch'
						},
						border : false,
						bodyPadding : 10,
						fieldDefaults : {
							labelAlign : 'top',
							labelWidth : 100,
							labelStyle : 'font-weight: bold'
						},
						items : [ {
							xtype : 'fieldcontainer',
							fieldLabel : 'your name',
							labelStyle : 'font-weight: bold; padding: 0;',
							layout : 'hbox',
							defaultType : 'textfield',
							fieldDefaults : {
								labelAlign : 'top'
							},
							items : [ {
								flex : 1,
								name : 'firstName',
								itemId : 'firstName',
								afterLabelTextTpl : required,
								fieldLabel : 'first',
								allowBlank : false
							}, {
								width : 30,
								name : 'middleIntitial',
								fieldLabel : 'MI',
								margins : '0 0 0 5'
							}, {
								flex : 2,
								name : 'lastName',
								afterLabelTextTpl : required,
								fieldLabel : 'last',
								allowBlank : false,
								margins : '0 0 0 5'
							} ]
						}, {
							xtype : 'textfield',
							fieldLabel : 'your email address',
							afterLabelTextTpl : required,
							vtype : 'email',
							allowBlank : false
						}, {
							xtype : 'textfield',
							fieldLabel : 'subject',
							afterLabelTextTpl : required,
							allowBlank : false
						}, {
							xtype : 'textareafield',
							fieldLabel : 'message',
							labelAlign : 'top',
							flex : 1,
							margins : '0',
							afterLabelTextTpl : required,
							allowBlank : false
						} ],

						buttons : [
								{
									text : 'cancel',
									handler : function() {
										this.up('form').getForm().reset();
										this.up('window').hide();
									}
								},
								{
									text : 'send',
									handler : function() {
										if (this.up('form').getForm().isValid()) {
											this.up('form').getForm().reset();
											this.up('window').hide();
											Ext.MessageBox
													.alert('thank you!',
															'yor inquiry has been sent. we will response as soon as possible!');
										}
									}
								} ]
					});

	Ext.create('Ext.window.Window', {
		title : 'tab panel form',
		width : 500,
		height : 400,
		modal : true,
		layout : 'fit',
		items : [ form ]
	}).show();
}

function showFieldTypeForm() {
	var form = Ext.create('Ext.form.Panel', {
		frame : true,
		autoScroll : true,
		bodyPadding : 5,
		fieldDefaults : {
			labelAlign : 'left',
			labelWidth : 90,
			anchor : '100%'
		},

		items : [ {
			xtype : 'textfield',
			name : 'textfield1',
			fieldLabel : 'text field',
			value : 'text field value'
		}, {
			xtype : 'hiddenfield',
			name : 'hidden1',
			value : 'hidden field value'
		}, {
			xtype : 'textfield',
			name : 'password1',
			inputType : 'password',
			fieldLabel : 'password field'
		}, {
			xtype : 'filefield',
			name : 'file1',
			fieldLabel : 'file upload'
		}, {
			xtype : 'textareafield',
			name : 'textarea1',
			fieldLabel : 'textarea',
			value : 'textarea values'
		}, {
			xtype : 'displayfield',
			name : 'displayfield1',
			fieldLabel : 'display field',
			value : 'display field  <span style="color:green;">value</span>'
		}, {
			xtype : 'numberfield',
			name : 'numberfield1',
			fieldLabel : 'number field',
			value : 5,
			minValue : 0,
			maxValue : 50
		}, {
			xtype : 'checkboxfield',
			name : 'checkbox1',
			fieldLabel : 'checkbox',
			boxLabel : 'box label'
		}, {
			xtype : 'radiofield',
			name : 'radio1',
			value : 'radiovalue1',
			fieldLabel : 'radio buttons',
			boxLabel : 'radio 1'
		}, {
			xtype : 'radiofield',
			name : 'radio1',
			value : 'radiovalue2',
			fieldLabel : '',
			labelSeparator : '',
			hideEmptyLabel : false,
			boxLabel : 'radio 2'
		}, {
			xtype : 'datefield',
			name : 'date1',
			fieldLabel : 'date field'
		}, {
			xtype : 'timefield',
			name : 'time1',
			fieldLabel : 'time field',
			minValue : '1:30 AM',
			maxValue : '9:15 PM'
		} ]
	});

	Ext.create('Ext.window.Window', {
		title : 'tab panel form',
		width : 500,
		height : 400,
		modal : true,
		layout : 'fit',
		items : [ form ]
	}).show();
}

function showRadioGroupForm() {
	var form = Ext.create('Ext.form.Panel', {
		xtype : 'container',
		layout : 'hbox',
		margin : '0 0 10',
		items : [ {
			xtype : 'fieldset',
			flex : 1,
			title : 'individual checkboxes',
			defaultType : 'checkbox',
			layout : 'anchor',
			defaults : {
				anchor : '100%',
				hideEmptyLabel : false
			},
			items : [ {
				xtype : 'textfield',
				name : 'txt-test1',
				fieldLabel : 'alignment test'
			}, {
				fieldLabel : 'favorite animals',
				boxLabel : 'dog',
				name : 'fav-animal-dog',
				inputValue : 'dog'
			}, {
				boxLabel : 'cat',
				name : 'fav-animal-cat',
				inputValue : 'cat'
			}, {
				checked : true,
				boxLabel : 'mokey',
				name : 'fav-animal-mokey',
				inputValue : 'mokey'
			} ]
		}, {
			xtype : 'component',
			width : 10
		}, {
			xtype : 'fieldset',
			flex : 1,
			title : 'individual radios',
			defaultType : 'radio',
			layout : 'anchor',
			defaults : {
				anchor : '100%',
				hideEmptyLabel : false
			},
			items : [ {
				xtype : 'textfield',
				name : 'txt-test2',
				fieldLabel : 'alignment test'
			}, {
				checked : true,
				fieldLabel : 'favorite color',
				boxLabel : 'red',
				name : 'fav-color',
				inputValue : 'red'
			}, {
				boxLabel : 'blue',
				name : 'fav-color',
				inputValue : 'blue'
			}, {
				boxLabel : 'green',
				name : 'fav-color',
				inputValue : 'green'
			} ]
		} ]
	});

	Ext.create('Ext.window.Window', {
		title : 'radio group form',
		width : 500,
		height : 400,
		modal : true,
		layout : 'fit',
		items : [ form ]
	}).show();
}

function getStore1() {
	return Ext.create('Ext.data.Store', {
		fields : [ 'text', 'val' ],
		data : [ {
			val : '123',
			text : 'one handred twenty three'
		}, {
			val : '1',
			text : 'one'
		}, {
			val : '2',
			text : 'two'
		}, {
			val : '3',
			text : 'three'
		}, {
			val : '4',
			text : 'four',
		}, {
			val : '5',
			text : 'five'
		}, {
			val : '6',
			text : 'six'
		}, {
			val : '7',
			text : 'seven'
		}, {
			val : '8',
			text : 'eight'
		}, {
			val : '9',
			text : 'nine'
		} ]
	});
}

function getDocks() {
	return [ {
		xtype : 'toolbar',
		dock : 'top',
		items : [ {
			text : 'options',
			menu : [ {
				text : 'get value',
				handler : function() {

				}
			}, {
				text : 'set value(2,3)',
				hanlder : function() {

				}
			}, {
				text : 'toggle enabled',
				checked : true,
				checkHandler : function(item, checked) {
				}
			}, {
				text : 'toggle delimiter',
				checked : true,
				checkHandler : function(item, checked) {
				}
			} ]
		} ]
	}, {
		xtype : 'toolbar',
		dock : 'bottom',
		ui : 'footer',
		defaults : {
			minWidth : 75
		},
		items : [ '->', {
			text : 'clear',
			handler : function() {

			}
		}, {
			text : 'reset',
			handler : function() {

			}
		}, {
			text : 'save',
			handler : function() {

			}
		} ]
	} ];
}

function showMultiSelectForm() {
	var store1 = getStore1();

	var docks = getDocks();

	var form = Ext.create('Ext.form.Panel', {
		bodyPadding : 10,
		items : [ {
			xtype : 'combo',
			multiSelect : true,
			fieldLabel : 'multiselect',
			msgTarget : 'side',
			store : store1,
			displayField : 'text',
			valueField : 'val',
			anchor : '100%',
			name : 'multiselect',
			allowBlank : false,
			value : [ '3', '4', '5' ]
		}, {
			xtype : 'itemselector',
			name : 'itemselector',
			anchor : '100%',
			store : store1,
			displayField : 'text',
			valueField : 'val'
		} ],
		dockedItems : docks
	});

	Ext.create('Ext.window.Window', {
		title : 'multi select form',
		width : 500,
		height : 400,
		modal : true,
		layout : 'fit',
		items : [ form ]
	}).show();
}

function showVboxForm() {
	var form = Ext.create('Ext.form.Panel', {
		border : 0,
		bodyPadding : 5,
		fieldDefaults : {
			labelWidth : 55,
			anchor : '100%'
		},
		layout : {
			type : 'vbox',
			align : 'stretch'
		},
		items : [
				{
					xtype : 'combo',
					store : Ext.create('Ext.data.ArrayStore', {
						fields : [ 'email' ],
						data : [ [ 'test@example.com' ],
								[ 'someone@example.com' ],
								[ 'someone-else@example.com' ] ]
					}),
					displayField : 'email',
					fieldLabel : 'send to',
					queryMode : 'local',
					selectOnTab : false,
					name : 'to'
				}, {
					xtype : 'textfield',
					fieldLabel : 'subject',
					name : 'subject'
				}, {
					xtype : 'textarea',
					fieldLabel : 'message text',
					hideLabel : true,
					name : 'msg',
					style : 'margin 0',
					flex : 1
				} ],
		dockedItems : [ {
			xtype : 'toolbar',
			dock : 'bottom',
			ui : 'footer',
			layout : {
				pack : 'center'
			},
			items : [ {
				minWidth : 80,
				text : 'send'
			}, {
				minWidth : 80,
				text : 'cancel'
			} ]
		} ]
	});
	Ext.create('Ext.window.Window', {
		title : 'multi select form',
		width : 500,
		height : 400,
		modal : true,
		layout : 'fit',
		items : [ form ]
	}).show();
}

function showHboxForm() {
	var form = Ext.create('Ext.form.Panel', {
		bodyStyle : 'padding: 5px 5px 0',
		fieldDefaults : {
			labelAlign : 'top',
			msgTarget : 'side'
		},
		defaults : {
			border : false,
			xtype : 'panel',
			flex : 1,
			layout : 'anchor'
		},
		layout : 'hbox',
		items : [ {
			items : [ {
				xtype : 'textfield',
				fieldLabel : 'first name',
				anchor : '-5',
				name : 'first'
			}, {
				xtype : 'textfield',
				fieldLabel : 'company',
				anchor : '-5',
				name : 'company'
			} ]
		}, {
			items : [ {
				xtype : 'textfield',
				fieldLabel : 'last name',
				anchor : '100%',
				name : 'last'
			}, {
				xtype : 'textfield',
				fieldLabel : 'email',
				anchor : '100%',
				name : 'email',
				vtype : 'email'
			} ]
		} ],
		buttons : [ '->', {
			text : 'save',
		}, {
			text : 'cancel'
		} ]
	});

	Ext.create('Ext.window.Window', {
		title : 'multi select form',
		width : 500,
		height : 400,
		modal : true,
		layout : 'fit',
		items : [ form ]
	}).show();
}

function showAnchorForm() {
	var form = Ext.create('Ext.form.Panel', {
		fieldDefaults : {
			labelWidth : 60
		},
		defaultType : 'textfield',
		bodyPadding : 5,
		items : [ {
			fieldLabel : 'send to',
			name : 'to',
			anchor : '100%'
		}, {
			fieldLabel : 'subject',
			name : 'subject',
			anchor : '100%'
		}, {
			xtype : 'textarea',
			hideLabel : true,
			name : 'msg',
			anchor : '100%'
		} ]
	});

	Ext.create('Ext.window.Window', {
		autoShow : true,
		title : 'multi select form',
		width : 500,
		height : 400,
		modal : true,
		layout : 'fit',
		items : [ form ]
	});
}

function showAbsoluteForm() {
	var form = Ext.create('Ext.form.Panel', {
		layout : 'absolute',
		defaultType : 'textfield',
		border : false,
		items : [ {
			fieldLabel : 'sent to',
			fieldWidth : 60,
			msgTarget : 'side',
			allowBlank : false,
			vtype : 'email',
			x : 5,
			y : 6,
			name : 'to',
			anchor : '-5'
		}, {
			fieldLabel : 'subject',
			fieldWidth : 60,
			x : 5,
			y : 35,
			name : 'subject',
			anchor : '-5'
		}, {
			x : 5,
			y : 65,
			xtype : 'textarea',
			style : 'margin: 0',
			hideLabel : true,
			name : 'msg',
			anchor : '-5 -5'
		} ],
		buttons : [ {
			text : 'send'
		}, {
			text : 'cnacel'
		} ]
	});

	Ext.create('Ext.window.Window', {
		autoShow : true,
		title : 'multi select form',
		width : 500,
		height : 400,
		modal : true,
		layout : 'fit',
		items : [ form ]
	});
}
