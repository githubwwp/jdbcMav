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

    showSimpleForm();
});

function showSimpleForm() {
    var form = Ext.create('Ext.form.Panel', {
        layout : 'form',
        autoScroll : true,
        bodyPadding : '5 5 5 5',
        fieldDefaults : {
            msgTarget : 'side' // 错误提示位置放在最后
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
