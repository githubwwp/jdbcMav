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
    showTabPanelForm();
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
